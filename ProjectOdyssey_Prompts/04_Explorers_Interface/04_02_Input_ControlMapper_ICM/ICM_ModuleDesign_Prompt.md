# Prompt for Implementing: Input_ControlMapper (ICM)

**Project:** Project Odyssey
**Pillar:** IV. The Explorer's Interface
**Module:** 2. `Input_ControlMapper (ICM)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Abstraction:** Abstracts input from various devices: keyboard, mouse (including n-button mice), gamepad, HOTAS (Hands On Throttle-And-Stick), potentially VR controllers in the future.
* **Context-Sensitivity:** Control schemes automatically adapt based on current context (e.g., on-foot controls, flight controls, map navigation controls, UI interaction).
* **Customization:** Allows user to remap controls.
* **First Principle Applied (Pillar IV):** Exploration of the vast universe requires intuitive controls. ICM ensures flexible and adaptable input handling.

## 2. Core Requirements & Functionality

You are to develop the `Input_ControlMapper (ICM)` module for Project Odyssey. This module is responsible for capturing raw hardware input, mapping it to abstract game actions, and managing context-sensitive control schemes.

1.  **Device Abstraction Layer:**
    * Implement support for common input devices:
        * Keyboard
        * Mouse (buttons, movement, scroll wheel)
        * Gamepad (XInput/DirectInput or equivalent, analog sticks, buttons, triggers, D-pad)
        * (Future) HOTAS: Throttles, joysticks with multiple axes and buttons.
        * (Future) VR Controllers.
    * Abstract raw device inputs into a common format (e.g., button presses/releases, axis values).
2.  **Action Mapping System:**
    * Define a system of abstract "game actions" (e.g., `MoveForward`, `FirePrimaryWeapon`, `ToggleMapView`, `IncreaseZoom`, `OpenMenu`).
    * Allow mapping of raw device inputs (e.g., 'W' key, 'Gamepad A button', 'Mouse X-axis') to these game actions.
    * Support for multiple bindings per action (e.g., 'W' key and 'Gamepad Left Stick Up' can both trigger `MoveForward`).
    * Handle different input types:
        * **Button/Key Actions:** Press, release, hold.
        * **Axis Actions:** Analog input values (e.g., for movement, look). Include deadzone and sensitivity settings.
        * **Chorded Actions:** (Optional) Actions triggered by pressing multiple buttons simultaneously.
3.  **Context-Sensitive Control Schemes ("Contexts"):**
    * Implement a system for defining different input "contexts" (e.g., `OnFootContext`, `FlightContext`, `MapViewContext`, `MenuContext`, `EVAContext`).
    * Each context defines its own set of action mappings.
    * The ICM must be able to switch active contexts dynamically based on game state (e.g., player enters ship, opens map).
    * Provide a clear API for other game systems to request context switches.
4.  **User Configuration & Rebinding:**
    * Allow users to view current key/button bindings for each context.
    * Allow users to rebind actions to different device inputs within each context.
    * Store and load user-defined binding configurations (e.g., to a configuration file).
    * Provide a "reset to default" option for bindings.
5.  **Input Processing & Dispatch:**
    * Process raw inputs each frame.
    * Translate raw inputs into game actions based on the currently active context and user bindings.
    * Dispatch these game actions to relevant consumer modules (e.g., `UnifiedCamera_ViewController`, `Player_VehicleKinematics`, `UserInterface_Engine`). This could be via an event system or direct callbacks.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Libraries (Potential):**
    * SDL, GLFW, or platform-specific APIs (Windows API, X11) for raw input capture. Many game engines provide their own input abstraction layers.
    * Consider libraries for gamepad support if not provided by the core engine/windowing layer.
* **Data Structures:** Maps/dictionaries for storing action mappings, context definitions.
* **Performance Considerations:**
    * Input processing happens every frame and must be highly efficient with minimal latency.
    * Avoid heap allocations during per-frame input processing if possible.
* **Error Handling & Resilience:**
    * Handle disconnected/reconnected input devices gracefully.
    * Manage errors in loading user binding configurations (e.g., fallback to defaults).
* **Logging:**
    * Log detected input devices at startup.
    * Log context switches.
    * Log errors related to input device handling or binding file parsing.
* **Security Considerations:**
    * If binding configurations are loaded from files, ensure parsing is robust against malformed data to prevent crashes or potential exploits (though typically low risk for local config files).

## 4. Integration Points

* **Input (receives data from):**
    * Operating System / Windowing System: For raw hardware input events.
    * Game State Manager (or equivalent): For signals to switch active input contexts.
    * Configuration System: For loading default and user-defined key bindings.
* **Output (provides data/services to):**
    * `UnifiedCamera_ViewController (UCVC)`: For look controls, camera mode changes, zoom.
    * `Player_VehicleKinematics (PVK)`: For player/vehicle movement and action commands.
    * `Warp_HyperspaceNavigation (WHN)`: For FTL travel commands.
    * `TimeDilation_Control (TDC)`: For time manipulation commands.
    * `ObjectInteraction_TargetingSystem (OITS)`: For targeting, selection, and interaction commands.
    * `UserInterface_Engine (UIE)`: For UI navigation commands (up, down, select, back) and direct input (e.g., typing in text fields).
    * Any other game system that needs to respond to player input.

## 5. Testing Strategy

* **Unit Tests:**
    * Test action mapping logic: verify correct actions are generated for given raw inputs under different bindings.
    * Test context switching: ensure only actions relevant to the active context are processed.
    * Test loading/saving of binding configurations.
* **Device Tests:**
    * Test with all supported input devices (keyboard, mouse, various gamepads, HOTAS if supported). Verify all buttons/axes are detected and mappable.
* **Functional Tests:**
    * Play through various game scenarios (on-foot, flight, map, menus) and confirm all actions can be triggered correctly using default and rebound controls.
    * Test rebinding functionality thoroughly.
* **Usability Testing:**
    * Gather user feedback on the intuitiveness of default control schemes and the ease of rebinding controls.

## 6. Documentation

* Document the system of abstract game actions and their intended effects.
* Explain how to define new input contexts and action mappings.
* Provide comprehensive documentation for ICM's API, particularly how other systems subscribe to or query game actions.
* Detail the format of the user binding configuration file.
* Provide guidelines for supporting new input devices.

## 7. Adherence to Project Principles

* **Active Observation & Interaction:** ICM is the primary translator of player intent into actions within the simulation, enabling interaction.
* **Modularity:** ICM decouples raw hardware input from game logic, allowing systems to respond to abstract actions rather than specific key presses.
* **Scalability (in terms of input devices):** Designed to accommodate various and future input hardware.