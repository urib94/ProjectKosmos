# Prompt for Implementing: UserInterface_Engine (UIE)

**Project:** Project Odyssey
**Pillar:** IV. The Explorer's Interface
**Module:** 7. `UserInterface_Engine (UIE)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Function:** Renders all UI elements (HUD, maps, menus, information panels).
* **Content:** Starmaps (2D and 3D) for navigation and visualization of known/discovered space. Customizable filters and overlays. HUD information, main menu, settings, ship configuration, contextual menus, information panels from Oracle AI.
* **First Principle Applied (Pillar IV):** Exploration requires intuitive controls and clear information display. UIE is the primary means of conveying information and receiving complex user commands.

## 2. Core Requirements & Functionality

You are to develop the `UserInterface_Engine (UIE)` module for Project Odyssey. This module is responsible for rendering all graphical user interface elements, managing UI state and navigation, and facilitating user interaction with game systems through the UI.

1.  **UI Rendering System:**
    * Implement or integrate a robust UI rendering system capable of drawing various UI elements: text, images, buttons, sliders, progress bars, checkboxes, dropdowns, scrollable lists, windows/panels.
    * Support for UI layout and anchoring.
    * Handle different screen resolutions and aspect ratios (scalable UI).
2.  **Heads-Up Display (HUD):**
    * Design and implement the player's HUD for different contexts (on-foot, in-flight).
    * Display critical information:
        * **Flight:** Speed, altitude, orientation (e.g., attitude indicator), target information (from OITS), fuel/energy levels, shield status (if any), FTL charge/status, G-force.
        * **On-Foot/EVA:** Health/suit integrity, oxygen/fuel levels, current objective, minimap (optional).
    * HUD elements should be non-intrusive but clearly legible.
3.  **Menu System:**
    * **Main Menu:** Start new game, load game, settings, credits, quit.
    * **Pause Menu:** Resume, settings, save game (if possible), quit to main menu.
    * **Settings Screens:** Graphics, audio, controls (interfacing with ICM for keybinding), gameplay options.
4.  **Information Panels & Displays:**
    * Display detailed information about selected/scanned objects (data from OITS, COD, Oracle AI).
    * Panels for ship status/configuration, inventory (if any), mission logs/journal, faction reputation.
    * Display responses from `Oracle AI (LLM)`.
5.  **Starmap System (Major Sub-Module):**
    * **2D Starmap:**
        * Display current galaxy (if applicable), highlighting player position, systems, nebulae, POIs.
        * Filterable by object type, factions, visited status, etc.
        * Ability to pan, zoom, select objects to get info or set as FTL target.
    * **3D Starmap:**
        * A navigable 3D representation of the local stellar neighborhood or galaxy.
        * Show star positions, connections (e.g., trade routes, FTL jump paths if pre-defined).
        * Allow free camera movement, rotation, zoom.
        * Display volumetric data like nebulae or faction influence spheres.
    * Data for starmaps comes from `CosmicObjectDatabase (COD)` and procedural generation info.
6.  **Contextual Menus:**
    * Display context-sensitive interaction menus when interacting with objects (triggered by OITS).
7.  **UI Navigation & Input Handling:**
    * Handle navigation within UI screens using mouse, keyboard (arrow keys, Enter, Esc), and gamepad.
    * Manage UI element focus and input capture (e.g., for text fields).
    * Interface with `Input_ControlMapper (ICM)` for UI-specific actions.
8.  **Theming & Styling:**
    * Support a theming or styling system to maintain a consistent visual identity for the UI.
    * Allow for customization of UI colors, fonts, element appearances (potentially by user).
9.  **Localization Support (Future Consideration):**
    * Design UI text handling with localization in mind (e.g., using string tables, support for different character sets).

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **UI Library/Framework (Crucial Decision):**
    * **Immediate Mode GUI (IMGUI):** Libraries like Dear ImGui are excellent for debug UIs and can be customized for in-game UIs. Very flexible and performant for certain styles.
    * **Retained Mode GUI:** More traditional UI approach. Could use a library like RmlUi, NoesisGUI (commercial), or an engine's built-in UI system (if using Godot, Unreal, Unity as a base).
    * **HTML/CSS/JS-based (Web UI):** Libraries like Ultralight or Coherent GT (commercial) allow using web technologies for complex UIs, rendered to a texture. Adds complexity but leverages web dev skills.
    * The choice significantly impacts development workflow and capabilities.
* **Font Rendering:** Robust font rendering library (e.g., FreeType, stb_truetype).
* **Performance Considerations:**
    * UI rendering should have minimal impact on overall frame rate.
    * Efficient batching of UI draw calls.
    * Optimize updates to dynamic UI elements (e.g., only redraw parts of the HUD that change).
* **Error Handling & Resilience:**
    * Handle missing UI assets (fonts, textures) gracefully.
    * Manage errors in UI layout or script execution (if UI uses scripting).
* **Logging:**
    * Log opening/closing of major UI screens.
    * Log errors in UI asset loading or rendering.
* **Security Considerations:**
    * If UI allows text input that is displayed to other players (multiplayer, not in current scope but for future), input sanitization would be needed. For a single-player game, risk is low but robust parsing of UI config files is still good.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * `Input_ControlMapper (ICM)`: For UI navigation inputs and direct text input.
    * `ObjectInteraction_TargetingSystem (OITS)`: To display target information on HUD, trigger context menus, display scan results.
    * `Player_VehicleKinematics (PVK)`: For HUD data (speed, fuel, etc.).
    * `Warp_HyperspaceNavigation (WHN)`: For FTL status, charge progress, target display.
    * `TimeDilation_Control (TDC)`: For displaying current `t_sim` and time scale factor.
    * `Oracle AI (KnowledgePresenter)`: To display LLM responses and information.
    * `CosmicObjectDatabase (COD)`: For populating starmaps and information panels.
    * Configuration System: For loading UI settings, themes.
* **Output (provides data/services to):**
    * The main rendering pipeline (renders UI elements, usually as an overlay).
    * `Input_ControlMapper (ICM)`: Can change input contexts (e.g., when a menu is opened, switch to `MenuContext`).
    * Various game systems when user interacts with UI elements (e.g., clicking "FTL Jump" button sends command to WHN).

## 5. Testing Strategy

* **Unit Tests:**
    * Test individual UI widget logic (e.g., button click, slider value change).
    * Test UI navigation logic.
* **Functional Tests:**
    * Navigate through all menus and UI screens. Verify all buttons, options, and displays work correctly.
    * Test HUD in various game states (flight, on-foot) and ensure information is accurate and updates correctly.
    * Thoroughly test the Starmap (2D and 3D) with selection, filtering, zoom/pan.
    * Verify information panels display correct data from different sources.
* **Usability Testing (Critical):**
    * Get extensive user feedback on UI clarity, ease of navigation, intuitiveness, and overall user experience.
    * Test readability of text and HUD elements at different resolutions.
    * Test controller/gamepad navigation of the UI.
* **Responsiveness & Layout Tests:**
    * Test UI scaling and layout on different screen resolutions and aspect ratios.
* **Performance Tests:**
    * Measure impact of UI rendering on frame rate, especially complex UIs like the 3D starmap.

## 6. Documentation

* Document the chosen UI library/framework and its usage patterns.
* Detail the structure of the HUD, main menus, settings screens, and starmap.
* Explain how to create new UI screens and widgets.
* Document the UI theming/styling system.
* Provide comprehensive documentation for UIE's API, especially how other systems provide data to be displayed or how UI events are handled.
* If localization is planned, document the string table format and workflow.

## 7. Adherence to Project Principles

* **Active Observation & Interaction:** UIE is the primary channel for the player to receive information from the simulation and to issue commands to its various systems.
* **Contextual & Interactive Learning:** Information panels and Oracle AI responses are displayed via UIE, facilitating learning.
* **Hierarchical & Scalable Universe:** The Starmap must effectively represent and allow navigation through the vast, hierarchical universe.
* **Modularity:** UIE should be a distinct layer responsible for presentation and UI logic, separate from core simulation systems.