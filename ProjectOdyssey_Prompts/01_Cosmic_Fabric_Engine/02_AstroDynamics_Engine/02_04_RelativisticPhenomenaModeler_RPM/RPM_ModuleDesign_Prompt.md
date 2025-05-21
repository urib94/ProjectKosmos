# Prompt for Implementing: RelativisticPhenomenaModeler (RPM)

**Project:** Project Odyssey
**Pillar:** II. The AstroDynamics Engine
**Module:** 4. `RelativisticPhenomenaModeler (RPM)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Scope:** Strong gravity regimes, primarily around neutron stars and black holes.
* **Process:** Provides parameters for:
    * Event horizons (Schwarzschild/Kerr metrics).
    * Accretion disk physics (simplified models: alpha-disk, or more advanced if performance allows, feeding into rendering).
    * Gravitational lensing (ray deflection calculations fed to renderer).
    * Gravitational time dilation effects (on local clocks, potentially visualized).
    * Relativistic jets (MHD principles simplified for visual output).
* **First Principle Applied (Pillar II):** Physical laws are universal but manifest differently at various scales and energies. A modular, multi-scale, and computationally efficient approach to physics is required. (RPM focuses on GR effects).

## 2. Core Requirements & Functionality

You are to develop the `RelativisticPhenomenaModeler (RPM)` module for Project Odyssey. This module is responsible for calculating parameters and providing simplified models for phenomena dominated by General Relativity, primarily associated with compact objects like neutron stars and black holes.

1.  **Compact Object Parameterization:**
    * Input: Properties of compact objects (mass, spin `a`, potentially charge `Q` though usually assumed zero for astrophysical BHs) from `CosmicObjectDatabase (COD)` (originating from `StellarEvolutionEngine (SEE)` or `CatalogIntegrator (CI)`).
    * **Event Horizon Calculation:**
        * For non-rotating (Schwarzschild) black holes: Calculate Schwarzschild Radius (R\_s = 2GM/c²).
        * For rotating (Kerr) black holes: Calculate locations of outer/inner event horizons, static limit (ergosphere boundaries).
    * **Innermost Stable Circular Orbit (ISCO):** Calculate ISCO radius for Schwarzschild and Kerr metrics (prograde/retrograde).
2.  **Accretion Disk Modeling (Parameterized for Visuals):**
    * If a compact object is determined to be accreting matter (e.g., based on proximity to a companion star or dense gas cloud – this logic might reside elsewhere or be a trigger for RPM), model the accretion disk:
        * **Geometry:** Define disk orientation, inner/outer radii (inner often at ISCO), thickness profile.
        * **Emission Profile (Simplified):** Implement a parameterized model for the disk's effective temperature and luminosity profile as a function of radius (e.g., standard Shakura-Sunyaev thin disk model where T(r) ∝ r⁻³/⁴). This directly feeds into shader parameters for rendering.
        * This module *does not* perform full MHD/hydrodynamical simulation of the disk. It provides parameters for the renderer.
3.  **Gravitational Lensing Parameterization:**
    * For light rays passing near massive compact objects, calculate parameters needed by the `QuantumLeap Renderer` to simulate gravitational lensing:
        * Einstein radius.
        * Deflection angles (can be approximated using formulae for Schwarzschild or Kerr spacetimes for rays with given impact parameters).
    * The RPM provides these parameters; the renderer's shader performs the visual distortion.
4.  **Relativistic Jet Modeling (Parameterized for Visuals):**
    * If an accreting compact object is expected to launch jets (e.g., based on spin, accretion rate, magnetic field presence – simplified criteria):
        * Define jet properties: initial opening angle, propagation speed (Lorentz factor γ), orientation (often aligned with spin axis), length/extent, power (for luminosity).
        * These parameters feed into particle systems and volumetric shaders in the renderer.
5.  **Gravitational Time Dilation Calculation:**
    * Provide functions to calculate the time dilation factor at a given distance from a massive object (Schwarzschild or Kerr metric) relative to a distant observer.
    * This can be used by `Explorer's Interface` to display local time flow for the player if they are very close to a compact object, or by `TemporalIndexer (TI)` if simulation needs to account for local time differences for certain events.
6.  **Frame Dragging (Lense-Thirring Effect - Visualization Support):**
    * Calculate parameters that would allow the renderer to visualize the effects of frame dragging (e.g., precession of orbits or accretion disk features) around rotating compact objects. Direct simulation of test particle orbits under Lense-Thirring is likely too expensive for general use but parameters for visual cues are feasible.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Libraries (Potential):** Numerical libraries for root-finding or solving equations if analytical solutions are not straightforward.
* **Mathematical Formulae:** Direct implementation of equations from GR textbooks for Schwarzschild and Kerr metrics (event horizons, ISCO, photon sphere, deflection angles, time dilation).
* **Performance Considerations:**
    * Calculations should be efficient as they might be queried by the renderer or UI frequently when a compact object is in view or selected.
    * Cache calculated parameters for a given object if its intrinsic properties (mass, spin) don't change rapidly.
* **Error Handling & Resilience:**
    * Handle invalid inputs (e.g., negative mass, spin `|a| > M` for Kerr BHs).
    * Manage numerical precision issues in GR calculations.
* **Logging:**
    * Log creation/update of RPM-managed parameters for a compact object.
    * Log warnings for invalid input parameters or extreme conditions.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * `CosmicObjectDatabase (COD)`: For properties of compact objects (mass, spin, potentially accretion state).
    * `StellarEvolutionEngine (SEE)`: When it forms a new neutron star or black hole, its properties are passed (via COD) to RPM.
    * Configuration System: For choosing specific GR models or approximation levels.
* **Output (provides data/services to):**
    * `QuantumLeap Renderer`: Critical parameters for shaders (lensing shader, accretion disk shader, jet particle systems), and for determining visibility of event horizons.
    * `Explorer's Interface`: For displaying information about event horizons, ISCO, time dilation effects.
    * `Oracle AI`: To provide scientifically grounded explanations of relativistic phenomena observed.
    * `TemporalIndexer (TI)`: Potentially for local time dilation effects.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify calculations for Schwarzschild radius, ISCO radius (Schwarzschild & Kerr), event horizon locations (Kerr) against known textbook values for given M and a.
    * Test accretion disk temperature/luminosity profiles against analytical Shakura-Sunyaev model predictions.
    * Test light deflection angle calculations.
    * Verify time dilation factor calculations.
* **Validation with Known Solutions:**
    * Compare outputs with results from established GR numerical relativity codes or analytical solutions for specific scenarios where possible (though this module is more about parameterization than full simulation).
* **Visual Inspection (via Renderer):**
    * Render a black hole with an accretion disk and jets using parameters from RPM. Visually inspect for plausibility:
        * Is the event horizon correctly depicted?
        * Does the accretion disk appear appropriately (hotter inner regions, correct orientation)?
        * Is gravitational lensing producing noticeable (and roughly correct) distortion of background objects?
* **Integration Tests:**
    * Ensure `StellarEvolutionEngine (SEE)` correctly triggers RPM when a compact object forms.
    * Verify that the `QuantumLeap Renderer` correctly utilizes all parameters provided by RPM for its specialized shaders.

## 6. Documentation

* Document all implemented General Relativity equations and their sources (e.g., specific textbook, paper).
* Detail the parameterized models used for accretion disks and jets, including assumptions and limitations.
* Provide comprehensive documentation for RPM's public API (how to query parameters for a given compact object).
* Explain how parameters are passed to and should be interpreted by the renderer.
* List any simplifications made compared to full GR solutions.

## 7. Adherence to Project Principles

* **Gravity-Dominated Structure:** RPM specifically deals with phenomena where gravity is overwhelmingly dominant and requires GR.
* **Scientific Grounding:** All models and calculations must be based on established principles of General Relativity and astrophysics of compact objects.
* **Finite Computation:** Parameterizes complex GR phenomena for efficient calculation and rendering, rather than attempting full numerical relativity simulations in real-time.
* **Active Observation:** Enables the user to visually observe and learn about otherwise invisible or hard-to-grasp relativistic effects.