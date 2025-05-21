# Prompt for Implementing: TimeDilation_Control (TDC)

**Project:** Project Odyssey
**Pillar:** IV. The Explorer's Interface
**Module:** 5. `TimeDilation_Control (TDC)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Functionality:** Allows user to accelerate, decelerate, pause, or even (locally, with caveats) reverse simulation time (`t_sim`).
* **Interaction:** Updates propagated through `TemporalIndexer (TI)` and `AstroDynamics Engine`.
* **First Principle Applied (Pillar IV):** Exploration requires intuitive controls. TDC allows users to observe long-duration phenomena or speed up travel.

## 2. Core Requirements & Functionality

You are to develop the `TimeDilation_Control (TDC)` module for Project Odyssey. This module provides the user with the ability to manipulate the flow rate of the global simulation time (`t_sim`).

1.  **Time Flow Control Mechanisms:**
    * **Pause/Resume:** Ability to pause the simulation (`t_sim` stops advancing) and resume it.
    * **Time Acceleration (Time Warp):** Allow the user to increase the rate at which `t_sim` advances relative to real-time.
        * Support multiple configurable acceleration levels (e.g., 2x, 10x, 100x, 1000x, up to very high factors for observing celestial orbits or stellar evolution).
        * Maximum acceleration factor might be limited by computational performance or to prevent physics instability.
    * **Time Deceleration (Slow Motion):** Allow the user to decrease the rate at which `t_sim` advances relative to real-time (e.g., 0.5x, 0.1x).
    * **Real-Time (1x):** Default state where `t_sim` advances at the same rate as real-time.
2.  **Interface with TemporalIndexer (TI):**
    * TDC's primary function is to communicate the desired time flow rate to the `TemporalIndexer (TI)`.
    * TI will then use this rate to calculate the `deltaTime` for each update tick of the simulation.
3.  **User Interface Feedback:**
    * Work with `UserInterface_Engine (UIE)` to provide clear visual feedback to the user about:
        * The current time flow state (paused, real-time, accelerated, decelerated).
        * The current time acceleration/deceleration factor.
        * The current simulation date/time (`t_sim`).
4.  **Contextual Limitations/Safeguards (Optional):**
    * Consider if time acceleration should be automatically limited or disabled during certain critical events or high-speed maneuvers to maintain player control or prevent physics issues (e.g., automatically drop to 1x time during docking or combat if implemented).
    * Define behavior when time controls are used during FTL travel (WHN) – does FTL have its own time scaling, or does TDC affect it?
5.  **"Time Reversal" (Conceptual - Highly Limited if Implemented):**
    * True reversal of complex universal evolution is computationally infeasible and often breaks causality.
    * If any "reversal" is implemented, it should be strictly limited to:
        * A very short "undo" of recent player actions.
        * A "replay" feature that quickly re-simulates a short past period, not a true reversal of state.
    * This feature is highly optional and complex. For initial design, focus on pause, acceleration, and deceleration.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Data Structures:** Store current time scale factor, list of available scale factors.
* **Performance Considerations:**
    * TDC itself is lightweight. The performance impact comes from how other systems (physics, AI, procedural generation) handle accelerated time.
    * High time acceleration factors will stress physics and event update systems. `PhysicsCulling_LOD_System (PCLS)` becomes even more critical.
* **Error Handling & Resilience:**
    * Prevent selection of invalid time scale factors.
    * Ensure smooth transitions when changing time scales.
* **Logging:**
    * Log changes to time flow rate (pause, resume, new factor).
    * Log current `t_sim` periodically if verbose logging is enabled.
* **Configuration:**
    * Define available time acceleration/deceleration steps.
    * Default time flow rate.
    * Optional limits on maximum acceleration.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * `Input_ControlMapper (ICM)`: For player commands to pause, resume, increase/decrease time flow rate.
    * `UserInterface_Engine (UIE)`: For UI buttons/sliders controlling time flow.
    * Potentially other game systems that might request a temporary change in time scale (e.g., for a slow-motion cinematic effect).
* **Output (provides data/services to):**
    * `TemporalIndexer (TI)`: This is the primary interaction point. TDC informs TI of the desired current time scale factor. TI then calculates `deltaTime` accordingly for all simulation updates.
    * `UserInterface_Engine (UIE)`: To display the current time scale, `t_sim`.

## 5. Testing Strategy

* **Unit Tests:**
    * Test setting and getting the time scale factor.
    * Verify correct application of pause/resume logic.
* **Functional Tests:**
    * Activate different time acceleration/deceleration levels and observe:
        * Orbital mechanics (`NBodyGravitationalOrchestrator`): Planets orbit faster/slower.
        * Stellar evolution (`StellarEvolutionEngine`): Stars change luminosity/size more rapidly at high acceleration (if observable over player timescales).
        * Player/vehicle movement (`Player_VehicleKinematics`): Ensure player actions are still responsive and physics remains stable at various time scales.
    * Test pause and resume functionality thoroughly.
* **Stress Tests:**
    * Run the simulation at maximum time acceleration for extended periods. Monitor for:
        * Physics instabilities.
        * Performance degradation.
        * Numerical precision issues in `t_sim` or evolving states.
* **Integration Tests:**
    * Verify that `TemporalIndexer (TI)` correctly uses the scale factor from TDC to modify `deltaTime`.
    * Ensure UI feedback accurately reflects the current time control state.

## 6. Documentation

* Document the available time control functions (pause, play, accelerate, decelerate).
* Explain the range of supported time scale factors and any limitations.
* Detail how TDC interacts with `TemporalIndexer (TI)` to affect `t_sim`.
* Document any contextual limitations or automatic adjustments to time scale.
* Explain the design philosophy regarding "time reversal" if any limited form is considered.

## 7. Adherence to Project Principles

* **Active Observation & Interaction:** TDC gives the user direct control over the flow of time, allowing them to observe long-duration phenomena or manage fast-paced events.
* **Evolving Matter & Energy:** Essential for observing processes like planetary orbits, stellar evolution, or galactic movements within a manageable player timeframe.
* **Finite Computation:** High time acceleration factors will test the limits of computational efficiency; TDC must work with PCLS and other systems to ensure stability.