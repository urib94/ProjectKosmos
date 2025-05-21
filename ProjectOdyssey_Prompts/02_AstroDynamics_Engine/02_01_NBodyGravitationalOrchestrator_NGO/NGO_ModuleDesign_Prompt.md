# Prompt for Implementing: NBodyGravitationalOrchestrator (NGO)

**Project:** Project Odyssey
**Pillar:** II. The AstroDynamics Engine
**Module:** 1. NBodyGravitationalOrchestrator (NGO)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Scope:** Local systems with significant gravitational interactions: planetary systems, binary/multiple star systems, star clusters, dense galactic cores.
* **Algorithms:**
    * High-Precision Integrators: For small-N systems (e.g., < ~1000 bodies), use symplectic integrators (e.g., Wisdom-Holman) or high-order adaptive integrators (e.g., IAS15, Gragg-Bulirsch-Stoer).
    * Tree-Codes / FMM: For larger N (star clusters, small galaxies), use Barnes-Hut (tree-code) or Fast Multipole Methods (FMM).
    * General Relativity Corrections: Incorporate Post-Newtonian terms (1PN, 2PN) for precision in strong field regimes.
* **Optimization:**
    * GPU acceleration (CUDA, OpenCL, Vulkan Compute shaders) for parallelizing force calculations.
    * Dynamically adjusts timestep per object or system based on local dynamical timescale and stability criteria.
    * Adaptive softening for close encounters to prevent numerical singularities.
    * Collision detection and handling (merge, bounce, fragment).

## 2. Core Requirements & Functionality

You are to develop the NBodyGravitationalOrchestrator (NGO) module for Project Odyssey. This module is responsible for simulating gravitational interactions in local systems with high accuracy and performance.

1.  **System Initialization:**
    * Accepts initial conditions for all bodies (positions, velocities, masses, etc.).
    * Supports input from procedural modules and catalog data.
2.  **Integrator Selection:**
    * Selects appropriate integration algorithm based on system size and required accuracy.
    * Allows for configuration of integrator parameters.
3.  **Force Calculation:**
    * Computes gravitational forces using direct summation, tree-codes, or FMM as appropriate.
    * Incorporates relativistic corrections where needed.
4.  **Time Stepping:**
    * Dynamically adjusts timestep for stability and performance.
    * Supports individual and global timesteps.
5.  **Collision Handling:**
    * Detects and handles collisions or close encounters.
    * Applies physical models for merging, bouncing, or fragmentation.
6.  **Output Definition:**
    * Outputs updated positions, velocities, and states for all bodies.
    * Provides data for rendering, further simulation, and storage.
7.  **Scalability & Performance:**
    * Optimized for multi-core CPUs and GPU acceleration.
    * Supports large N systems efficiently.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Libraries (Potential):**
    * Use established numerical libraries for integration and linear algebra.
    * Consider GPU libraries for acceleration.
* **Data Structures:** Efficient representations for bodies, forces, and system state.
* **Algorithmic Choices:**
    * Allow for selection and configuration of integrators and force calculation methods.
* **Configuration:**
    * Allow for tuning of accuracy, performance, and collision handling parameters.

## 4. Integration Points

* **Input:**
    * Initial conditions from procedural and catalog modules.
    * Configuration parameters.
* **Output (consumed by):**
    * QuantumLeap Renderer: For visual representation.
    * TemporalIndexer: For time-dependent state queries.
    * Other physics modules: For further simulation.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct integration and force calculation for small systems.
    * Test collision detection and handling.
* **Performance Tests:**
    * Benchmark force calculation and integration for large N systems.
* **Validation:**
    * Compare results to analytical solutions and published N-body simulations.
* **Integration Tests:**
    * Ensure compatibility with input and output consumers.

## 6. Documentation

* Document the integration algorithms and force calculation methods used.
* Specify the format and structure of system state data.
* Provide guidance for tuning performance and accuracy.

## 7. Adherence to Project Principles

* **Gravity-Dominated Structure:** NGO simulates the gravitational interactions that shape local systems.
* **Finite Computation:** Uses efficient algorithms and hardware acceleration for performance.
* **Scientific Grounding:** Implements established physical models and numerical methods.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 