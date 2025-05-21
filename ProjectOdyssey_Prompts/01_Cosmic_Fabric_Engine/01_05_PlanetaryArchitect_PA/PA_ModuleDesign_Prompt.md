# Prompt for Implementing: PlanetaryArchitect (PA)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 5. PlanetaryArchitect (PA)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Input:** UGS, planet/moon seed from StellarNursery (SN), local stellar environment (radiation, tides).
* **Process:** Generates detailed physical and chemical properties for planets and moons:
    * Calculates radius, mass, density, and internal structure (core, mantle, crust differentiation based on composition and thermal history).
    * Models atmospheric formation and composition (primary, secondary atmospheres), pressure, and temperature profile using energy balance equations.
    * Generates surface terrain using procedural techniques (fractal noise, erosion, tectonic/volcanic features).
    * Distributes biomes and potential for life (if applicable) based on predefined rules or habitability models.
    * Parameterizes volcanism, tectonics, and magnetic field generation.
* **Output:** Detailed planet/moon object definitions with physical, geological, and atmospheric data.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the PlanetaryArchitect (PA) module for Project Odyssey. This module is responsible for generating detailed planets and moons in a deterministic, scientifically plausible manner.

1.  **Planet/Moon Generation:**
    * Accepts planet/moon seeds and environment from SN.
    * For each seed, generate a planet or moon with detailed physical and chemical properties.
2.  **Physical Properties:**
    * Calculate radius, mass, density, and internal structure.
    * Model differentiation (core, mantle, crust) based on composition and thermal history.
3.  **Atmospheric Modeling:**
    * Generate atmospheric composition, pressure, and temperature profile.
    * Model primary and secondary atmospheres, and atmospheric loss if applicable.
4.  **Surface & Terrain Generation:**
    * Use procedural techniques (fractal noise, erosion, tectonics, volcanism) to generate surface features.
    * Parameterize volcanism, tectonics, and magnetic field generation.
5.  **Biomes & Habitability:**
    * Distribute biomes and assess potential for life based on habitability models.
6.  **Output Definition:**
    * Output a data structure representing the planet/moon, including all relevant properties.
    * Ensure compatibility with downstream modules (CatalogIntegrator, CosmicObjectDatabase, Renderer).
7.  **Scalability & Performance:**
    * Support on-demand generation of planets/moons as needed by observer context.
    * Consider LOD for detail based on distance or simulation needs.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Efficient representations for planetary properties, terrain, and atmospheres.
* **Algorithmic Choices:**
    * Use geophysical and atmospheric models from planetary science.
    * Allow for procedural noise/randomization (seeded by UGS) for diversity.
* **Configuration:**
    * Allow for parameter tuning via configuration files or presets.

## 4. Integration Points

* **Input:**
    * Planet/moon seeds and environment from SN.
    * UGS for deterministic generation.
* **Output (consumed by):**
    * CatalogIntegrator (CI): For blending with real data.
    * CosmicObjectDatabase (COD): For storage and spatial queries.
    * QuantumLeap Renderer: For visual representation.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify deterministic generation of planets/moons from identical seeds and UGS.
    * Test property assignment and terrain generation.
* **Statistical Validation:**
    * Compare generated planet/moon properties to observed data (e.g., mass-radius relation, atmospheric composition).
* **Integration Tests:**
    * Ensure compatibility with CI and COD modules.
* **Visual Inspection:**
    * Render sample planets/moons for qualitative assessment.

## 6. Documentation

* Document the planet/moon generation process, including models and algorithms used.
* Specify the format and structure of planet/moon data output.
* Provide guidance for parameter tuning and extension.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** PA builds on star systems from SN, creating the next level of structure.
* **Scientific Grounding:** Use planetary science models and data for realism.
* **Finite Computation:** Generate only as needed, with LOD and efficient data structures.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 