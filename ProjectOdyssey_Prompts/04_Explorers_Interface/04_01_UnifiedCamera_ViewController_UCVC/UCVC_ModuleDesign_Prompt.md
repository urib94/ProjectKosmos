# Prompt for Implementing: UnifiedCamera_ViewController (UCVC)

**Project:** Project Odyssey
**Pillar:** IV. The Explorer's Interface
**Module:** 1. UnifiedCamera_ViewController (UCVC)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Modes:** Seamless transitions between:
    * **First-Person:** On foot (planetary surface), in cockpit of spacecraft.
    * **Third-Person:** Orbital camera (around selected object), free-look chase camera, cinematic camera paths.
* **Scaling:** Logarithmic zoom capabilities and movement speed scaling that adapts to the current viewing scale (e.g., slow movement on a planet, AU/s in a solar system, lightyears/s for interstellar travel).
* **Collision Detection:** Camera collision with terrain and objects to prevent clipping and enhance immersion.
* **Field of View (FOV):** Dynamic FOV adjustment based on speed or user preference.
* **First Principle Applied (Pillar IV):** Exploration of the vast universe requires intuitive controls. The camera is the user's primary window into this universe.

## 2. Core Requirements & Functionality

You are to develop the UnifiedCamera_ViewController (UCVC) module for Project Odyssey. This module manages all aspects of the player's viewpoint, camera modes, and visual navigation aids.

1.  **Camera Mode Management:**
    * **First-Person Camera (FPC):**
        * Attached to player avatar (on-foot) or vehicle cockpit.
        * Head bob / view smoothing options.
        * Limited by physical constraints of the avatar/vehicle.
    * **Third-Person Camera (TPC):**
        * **Orbital Camera:** Smoothly orbits a selected target object (ObjectInteraction_TargetingSystem). Controls for distance, pitch, yaw relative to target.
        * **Chase Camera:** Follows player vehicle with configurable distance, height, and damping.
        * **Free-Look Camera:** Detached camera for exploration, debugging, or cinematic shots. Not constrained by player/vehicle physics.
    * **Seamless Transitions:** Implement smooth, interpolated transitions between camera modes (e.g., zooming out from cockpit to orbital view).
2.  **View Control & Navigation:**
    * **Mouse/Gamepad Look:** Standard look controls (pitch/yaw) for all camera modes.
    * **Zoom Functionality:** Logarithmic zoom capability, allowing smooth scaling from meters to light-years. Zoom speed should adapt to current scale.
    * **Movement Speed Scaling (for Free-Look/Debug Camera):** Movement speed (pan, dolly) should scale with zoom level or distance to target, enabling both fine-grain adjustments and rapid large-scale traversal.
3.  **Camera Collision System:**
    * Implement camera collision detection to prevent the camera (especially TPC) from clipping through terrain or other objects.
    * Employ techniques like sphere-casting from the target to the camera, or pushing the camera forward along its view vector if a collision is detected.
4.  **Dynamic Field of View (FOV):**
    * Allow dynamic adjustment of the camera's FOV.
    * Optionally, link FOV to player/vehicle speed (wider FOV at higher speeds for sense of motion).
    * User-configurable base FOV.
5.  **Camera Shake & Effects:**
    * Implement a system for applying camera shakes (e.g., for impacts, explosions, engine rumble, atmospheric turbulence). Effects should be controllable in intensity and duration.
6.  **Target Tracking & Framing:**
    * For TPC modes, implement robust target tracking and framing logic to keep selected objects well-centered or composed in the view, even during movement.
    * "Look At" functionality for all cameras.
7.  **Cinematic Camera System (Optional - Advanced):**
    * Support for predefined or procedurally generated cinematic camera paths (splines, keyframes) for cutscenes, beauty shots, or automated tours.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Mathematical Libraries:** Extensive use of 3D math (vectors, matrices, quaternions, splines for paths).
* **Performance Considerations:**
    * Camera calculations occur every frame and must be highly efficient.
    * Collision detection/response should be optimized to avoid performance drops.
* **Error Handling & Resilience:**
    * Handle cases where camera targets are invalid or suddenly disappear.
    * Ensure smooth recovery if camera gets into an undesirable state (e.g., stuck in geometry  though collision should prevent this).
* **Logging:**
    * Log camera mode switches.
    * Log FOV or significant exposure changes if tied to camera.
    * Log errors in camera collision or target tracking.
* **Configuration:**
    * Camera sensitivities, default FOV, collision parameters, smoothing factors should be user-configurable.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * Input_ControlMapper (ICM): For raw player input (mouse, gamepad) driving camera look and potentially movement (in free-look).
    * Player_VehicleKinematics (PVK): For position/orientation of player avatar or vehicle to attach FPC or TPC (chase).
    * ObjectInteraction_TargetingSystem (OITS): For the currently selected target object for orbital/tracking cameras.
    * UserInterface_Engine (UIE): For triggering camera mode changes or cinematic sequences.
    * SceneGraph_MultiScaleCoordinateSystem (SMCS): For camera frustum parameters, world position.
* **Output (provides data/services to):**
    * SceneGraph_MultiScaleCoordinateSystem (SMCS) & QuantumLeap Renderer: Provides the view matrix, projection matrix, camera position, and frustum planes necessary for rendering.
    * Potentially other systems that need to know the player's viewpoint (e.g., AudioEngine for positional audio).

## 5. Testing Strategy

* **Unit Tests:**
    * Test camera transformation math (view/projection matrices).
    * Test individual camera mode logic (e.g., orbital camera following a moving target).
    * Test zoom scaling and movement speed scaling.
* **Functional Tests:**
    * Switch between all camera modes and verify smooth transitions and correct behavior.
    * Test camera collision with various complex geometries.
    * Verify FOV adjustments and camera shake effects.
    * Test target tracking in dynamic scenarios.
* **Usability Testing:**
    * Critical for camera controls. Get user feedback on intuitiveness, responsiveness, and comfort across different scales of navigation.
* **Performance Tests:**
    * Ensure camera system has minimal overhead on frame rate.
    * Test performance of camera collision system in dense environments.

## 6. Documentation

* Document each camera mode, its controls, and its specific behaviors.
* Explain the logarithmic zoom and speed scaling mechanisms.
* Detail the camera collision detection and response algorithms.
* Provide comprehensive documentation for UCVC's API, especially how other systems can set targets, trigger mode changes, or query camera state.
* Document all configurable camera parameters.

## 7. Adherence to Project Principles

* **Active Observation:** The UCVC is the primary interface through which the user actively observes and experiences the universe. Its design directly impacts immersion and usability.
* **Hierarchical & Scalable Universe:** Logarithmic zoom and adaptive movement speed are essential for navigating the vast scales handled by the simulation.
* **Modularity:** UCVC should be a distinct system managing view and perspective, interacting with but separate from player/vehicle physics.
