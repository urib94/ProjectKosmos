# Prompt for Implementing: Player_VehicleKinematics (PVK)

**Project:** Project Odyssey
**Pillar:** IV. The Explorer's Interface
**Module:** 3. `Player_VehicleKinematics (PVK)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Player Avatar (On-Foot/EVA):** Manages player character state, movement physics (walking, running, jumping on planetary surfaces with varying gravity), EVA jetpack controls in vacuum.
* **Spacecraft Flight Model:**
    * Newtonian physics (6 Degrees of Freedom: translation X/Y/Z, rotation pitch/yaw/roll) for direct spacecraft control.
    * Thruster mechanics: main engines, maneuvering thrusters, reaction control systems (RCS). Fuel consumption models.
    * Flight Assists: Optional assists like flight stabilization, orientation hold (e.g., prograde, retrograde, normal to target), anti-collision warnings/maneuvers.
* **Interaction:** Interacts with `AstroDynamics Engine (NGO)` for local physics effects (gravity, atmospheric drag if applicable).
* **First Principle Applied (Pillar IV):** Exploration requires intuitive controls. PVK translates user intent into believable motion for their avatar or vehicle.

## 2. Core Requirements & Functionality

You are to develop the `Player_VehicleKinematics (PVK)` module for Project Odyssey. This module is responsible for simulating the movement and physical state of the player's avatar (on-foot/EVA) and their controlled vehicles (spacecraft).

1.  **Player Avatar Kinematics (On-Foot):**
    * **State Management:** Track player position, orientation, velocity, current surface interaction (grounded, falling, jumping).
    * **Movement:** Implement walking, running, sprinting, jumping. Movement speed should be affected by surface gravity (from planetary data).
    * **Collision Detection & Response:** Simple capsule or character controller collision with terrain and static objects. Respond to collisions realistically (stop, slide).
    * **Gravity Application:** Apply gravitational force from the planet currently occupied.
2.  **Player Avatar Kinematics (EVA - Extra-Vehicular Activity):**
    * **6DoF Movement:** Implement jetpack-based movement in zero-gravity environments (translation X/Y/Z, rotation pitch/yaw/roll).
    * **Fuel/Propellant Model:** Simple resource consumption for EVA thrusters.
    * **Attachment/Magnetism:** (Optional) Ability to "attach" to ship hulls or station surfaces.
3.  **Spacecraft Flight Model (Newtonian with Assists):**
    * **6DoF Physics:** Implement a full Newtonian flight model for spacecraft:
        * Track position, orientation (quaternion), linear velocity, angular velocity.
        * Apply forces and torques from thrusters.
        * Conserve linear and angular momentum.
    * **Thruster Mechanics:**
        * Define different thruster types: main engines (high thrust, specific direction), maneuvering thrusters (moderate thrust, directional), RCS (low thrust, for fine orientation control).
        * Model thrust output and fuel/propellant consumption for each thruster type.
        * Thrusters apply forces/torques at specific points on the ship's physics model (if detailed, otherwise simplified).
    * **Flight Assist Modes (Toggleable):**
        * **Full Newtonian (Manual):** Player directly controls thrusters.
        * **Stabilization Assist:** Automatically counteracts rotation/translation to bring ship to a halt or maintain current orientation/velocity.
        * **Orientation Hold:** (e.g., Prograde, Retrograde, Normal/Anti-Normal to orbit, Target-relative orientation).
        * **Velocity Control:** (e.g., Maintain current speed, match target speed).
        * (Future) Autopilot functions (docking, landing) will build upon these assists but are likely part of `Warp_HyperspaceNavigation (WHN)` or a dedicated autopilot module.
4.  **External Force Integration:**
    * **Gravity:** Apply gravitational forces from nearby celestial bodies (primarily the dominant one, or summed from multiple significant ones via `NBodyGravitationalOrchestrator`).
    * **Atmospheric Drag (Simplified):** If a vehicle enters an atmosphere (data from PAD/PA), apply a simplified drag force opposing motion, dependent on atmospheric density and vehicle velocity/shape.
5.  **State Synchronization:**
    * The PVK module updates the authoritative position, orientation, and velocity of the player-controlled entity. This state must be readable by `CosmicObjectDatabase (COD)` (if player entity is stored there) and `UnifiedCamera_ViewController (UCVC)`.
6.  **Vehicle Definition:**
    * Allow defining different vehicle types with varying physical properties (mass, inertia tensor, thruster placements/strengths, fuel capacity).

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Physics Engine (Core):** While interacting with NGO for external gravity, PVK implements its *own* rigid-body dynamics for player-controlled entities. It is *not* typically a full physics engine like PhysX/Bullet unless the project decides to integrate one for all dynamic objects.
* **Mathematical Libraries:** Extensive use of 3D vector math, quaternions, matrix operations for physics calculations.
* **Performance Considerations:**
    * Physics updates for the player entity occur every physics tick and must be very fast.
    * Optimize collision detection and response.
    * Ensure numerical stability in the physics integration.
* **Error Handling & Resilience:**
    * Handle extreme forces or velocities gracefully (clamping, error reporting).
    * Manage situations where player entity might get stuck (though robust collision should prevent this).
* **Logging:**
    * Log player/vehicle state transitions (e.g., entering/exiting ship, landing, taking off).
    * Log application of significant external forces.
    * Log errors in physics calculations or collisions.
* **Security Considerations:**
    * If any physics parameters are modifiable by users (e.g., via modding ship files), validate inputs to prevent physics exploits or crashes.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * `Input_ControlMapper (ICM)`: For player commands (move, jump, activate thrusters, toggle flight assists).
    * `CosmicObjectDatabase (COD)` & `PlanetaryArchitect (PA)`: For surface gravity, atmospheric density of current planet.
    * `NBodyGravitationalOrchestrator (NGO)`: For gravitational forces from celestial bodies.
    * Configuration System: For vehicle physics parameters, flight assist settings.
* **Output (provides data/services to):**
    * `UnifiedCamera_ViewController (UCVC)`: Provides position/orientation for FPC attachment or TPC tracking.
    * `CosmicObjectDatabase (COD)`: Updates the state (position, velocity, orientation) of the player-controlled entity if it's a COD object.
    * `QuantumLeap Renderer (SMCS)`: Indirectly, by updating the transform of the player/vehicle renderable representation.
    * `AudioEngine (AE)`: Triggers for engine sounds, impacts, footsteps.
    * `UserInterface_Engine (UIE)`: For displaying HUD information (speed, altitude, fuel, G-force).

## 5. Testing Strategy

* **Unit Tests:**
    * Test thruster force/torque calculations.
    * Test individual flight assist modes (e.g., does orientation hold maintain orientation under small disturbances?).
    * Test on-foot movement physics (jumping height/distance under different gravities).
    * Test EVA jetpack controls.
* **Functional Tests:**
    * **Flight:** Pilot various spacecraft. Verify responsiveness, stability, and correct behavior of Newtonian physics and flight assists. Test docking/landing if manually controlled.
    * **On-Foot:** Navigate different planetary surfaces. Verify movement feels correct under varying gravity. Test collision with simple obstacles.
    * **EVA:** Maneuver in zero-G. Verify thruster control and fuel consumption.
* **Scenario Tests:**
    * Test atmospheric entry/flight (if drag is implemented).
    * Test behavior in strong gravitational fields.
* **Usability Testing:**
    * Crucial for flight controls and on-foot movement. Ensure controls feel intuitive and responsive, not floaty or overly sensitive.
* **Performance Tests:**
    * Measure CPU cost of PVK updates. Ensure it's minimal.

## 6. Documentation

* Document the player avatar kinematics model (on-foot and EVA).
* Detail the spacecraft flight model (Newtonian physics, thruster mechanics, force integration).
* Explain each flight assist mode and its algorithm.
* Provide comprehensive documentation for PVK's API (how it receives input, how its state is queried).
* Document the format for defining vehicle physics properties.
* Explain how external forces (gravity, drag) are incorporated.

## 7. Adherence to Project Principles

* **Active Observation & Interaction:** PVK is the direct embodiment of the player's physical presence and interaction within the simulation.
* **Scientific Grounding:** Spacecraft flight model based on Newtonian physics. On-foot movement considers surface gravity.
* **Modularity:** PVK focuses on player-controlled entity physics, distinct from the large-scale N-body simulation of celestial objects.