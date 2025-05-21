# Prompt for Implementing: GalacticForge (GF)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 3. GalacticForge (GF)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Input:** UGS, galaxy seed location/density from CosmologicalModeler (CM), environmental factors.
* **Process:** Procedurally generates individual galaxies:
    * Determines galaxy type (spiral, elliptical, irregular) based on initial conditions, environment, and seeded properties.
    * Defines overall properties (total mass, virial radius, angular momentum, dark matter halo profile).
    * Models structural components (bulge, disk - thin/thick, stellar halo, gas content).
    * Simulates star formation history and metallicity gradients.
    * Places/models a central supermassive black hole (SMBH) with appropriate mass scaling relations.
    * Distributes star-forming regions and stellar populations (old, young).
* **Output:** Galaxy object definition, including structural parameters, stellar population characteristics, and gas distribution.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the GalacticForge (GF) module for Project Odyssey. This module is responsible for generating galaxies in a scientifically plausible, deterministic, and modular way.

1.  **Galaxy Seed Handling:**
    * Accepts galaxy seed points and environmental data from CM.
    * Each seed should deterministically generate a unique galaxy based on the UGS and its properties.
2.  **Galaxy Type Determination:**
    * Implement logic to assign galaxy types (spiral, elliptical, irregular) based on seed/environmental parameters.
    * Allow for rare/peculiar types (e.g., ring, lenticular) as edge cases.
3.  **Structural & Physical Properties:**
    * Calculate total mass, virial radius, angular momentum, and dark matter halo profile for each galaxy.
    * Model bulge, disk(s), stellar halo, and gas content with appropriate scaling relations.
    * Simulate star formation history and metallicity gradients.
4.  **Central Black Hole Modeling:**
    * Place a central SMBH in each galaxy, with mass determined by scaling relations (e.g., M-sigma relation).
5.  **Stellar Population Synthesis:**
    * Distribute star-forming regions and stellar populations (old, young) within the galaxy structure.
    * Allow for parameterization of star formation rates, metallicity, and age distributions.
6.  **Output Definition:**
    * Output a data structure representing the galaxy, including all relevant physical, structural, and population parameters.
    * Ensure compatibility with downstream modules (StellarNursery, CosmicObjectDatabase, Renderer).
7.  **Scalability & Performance:**
    * Support on-demand generation of galaxies as needed by observer context.
    * Consider LOD for galaxy detail based on distance or simulation needs.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Efficient representations for galaxy components, stellar populations, and gas content.
* **Algorithmic Choices:**
    * Use scaling relations and empirical models from astrophysics literature.
    * Allow for procedural noise or randomization (seeded by UGS) for diversity.
* **Configuration:**
    * Allow for parameter tuning via configuration files or presets.

## 4. Integration Points

* **Input:**
    * Galaxy seeds and environment from CM.
    * UGS for deterministic generation.
* **Output (consumed by):**
    * StellarNursery (SN): For star system generation.
    * CosmicObjectDatabase (COD): For storage and spatial queries.
    * QuantumLeap Renderer: For visual representation.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify deterministic generation of galaxies from identical seeds and UGS.
    * Test galaxy type assignment and property calculation.
* **Statistical Validation:**
    * Compare generated galaxy distributions and properties to observed data (e.g., mass function, Tully-Fisher relation).
* **Integration Tests:**
    * Ensure compatibility with SN and COD modules.
* **Visual Inspection:**
    * Render sample galaxies for qualitative assessment.

## 6. Documentation

* Document the galaxy generation process, including algorithms and scaling relations used.
* Specify the format and structure of galaxy data output.
* Provide guidance for parameter tuning and extension.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** GF builds on the LSS from CM, creating the next level of cosmic structure.
* **Scientific Grounding:** Use astrophysical models and data for realism.
* **Finite Computation:** Generate only as needed, with LOD and efficient data structures.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 