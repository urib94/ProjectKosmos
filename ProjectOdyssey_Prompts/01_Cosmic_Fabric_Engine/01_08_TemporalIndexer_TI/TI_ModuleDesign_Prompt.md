# Prompt for Implementing: TemporalIndexer (TI)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 8. TemporalIndexer (TI)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Function:**
    * Maintains a consistent simulation time `t_sim` across the universe.
    * Allows querying the state of any object or region at any given `t_sim`.
    * Works with the AstroDynamics Engine to project states forward or backward in time based on physical models.
    * Fundamental for user-controlled time manipulation (acceleration, deceleration, pause).
* **Note:** Full reversibility of complex physics is often impossible; this module will rely on stored states at keyframes or re-simulation for historical views where needed.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the TemporalIndexer (TI) module for Project Odyssey. This module is responsible for managing simulation time and enabling time-based queries and manipulation.

1.  **Simulation Time Management:**
    * Maintain a global simulation time variable (`t_sim`).
    * Support time acceleration, deceleration, and pausing.
2.  **State Querying:**
    * Allow querying the state of any object or region at a given `t_sim`.
    * Interface with physics modules to project states as needed.
3.  **Time Manipulation:**
    * Enable user-controlled time flow (speed up, slow down, pause).
    * Support limited reversibility via keyframes or re-simulation.
4.  **Integration with Other Modules:**
    * Provide time information to all modules that require it (physics, rendering, AI, etc.).
    * Coordinate with the AstroDynamics Engine for state projection.
5.  **Scalability & Performance:**
    * Efficiently manage time updates and queries for large numbers of objects.
    * Optimize for real-time performance.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Efficient representations for time, keyframes, and state histories.
* **Algorithmic Choices:**
    * Use interpolation, extrapolation, and re-simulation as needed for state queries.
    * Allow for configuration of keyframe intervals and time step sizes.
* **Configuration:**
    * Allow for tuning of time flow parameters and keyframe storage.

## 4. Integration Points

* **Input:**
    * User input for time control.
    * State data from all modules.
* **Output (consumed by):**
    * All modules requiring time information or state queries.
    * QuantumLeap Renderer: For time-dependent visual effects.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct time management and state querying.
    * Test time manipulation features (acceleration, pause, limited reversal).
* **Performance Tests:**
    * Benchmark time update and query operations.
* **Integration Tests:**
    * Ensure compatibility with all consuming modules.

## 6. Documentation

* Document the time management and state querying process.
* Specify the format and structure of time and state data.
* Provide guidance for tuning performance and extending functionality.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** TI enables consistent time management across all scales.
* **Finite Computation:** Efficiently manages time and state data.
* **Performance:** Optimized for real-time simulation.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 