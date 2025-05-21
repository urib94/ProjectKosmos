# Prompt for Implementing: StellarNursery (SN)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 4. StellarNursery (SN)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Input:** UGS, star-forming region data (gas density, temperature, metallicity) from GalacticForge (GF).
* **Process:** Generates individual star systems within galaxies:
    * Determines star type(s) using an Initial Mass Function (IMF, e.g., Salpeter, Chabrier) and local metallicity.
    * Generates single stars, binaries, and multiple star systems.
    * Models protoplanetary disk formation around nascent stars (mass, size, lifetime, composition).
    * Simulates planetary system formation based on core accretion or gravitational instability models, considering disk properties and stellar type.
    * Assigns initial orbital elements (semi-major axis, eccentricity, inclination, etc.) based on formation models and N-body stability criteria.
* **Output:** Star system object definitions, including stellar properties and planetary/minor body characteristics.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the StellarNursery (SN) module for Project Odyssey. This module is responsible for generating star systems and their initial planetary disks in a deterministic, scientifically plausible manner.

1.  **Star System Generation:**
    * Accepts star-forming region data from GF.
    * For each region, generate a set of star systems using a chosen IMF and local metallicity.
    * Support single, binary, and multiple star systems.
2.  **Stellar Properties:**
    * Assign mass, spectral type, age, and metallicity to each star.
    * Model stellar multiplicity and orbital parameters for binaries/multiples.
3.  **Protoplanetary Disk Modeling:**
    * For each nascent star, generate a protoplanetary disk with mass, size, composition, and lifetime based on stellar and environmental properties.
4.  **Planetary System Formation:**
    * Simulate planet formation using core accretion or gravitational instability models.
    * Generate planets (terrestrial, gas giants, ice giants), moons, asteroid belts, and minor bodies.
    * Assign initial orbital elements for all bodies.
5.  **Output Definition:**
    * Output a data structure representing the star system, including all stellar and planetary properties.
    * Ensure compatibility with downstream modules (PlanetaryArchitect, CosmicObjectDatabase, Renderer).
6.  **Scalability & Performance:**
    * Support on-demand generation of star systems as needed by observer context.
    * Consider LOD for system detail based on distance or simulation needs.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Efficient representations for star systems, disks, and planetary bodies.
* **Algorithmic Choices:**
    * Use astrophysical models for IMF, disk formation, and planet formation.
    * Allow for procedural noise or randomization (seeded by UGS) for diversity.
* **Configuration:**
    * Allow for parameter tuning via configuration files or presets.

## 4. Integration Points

* **Input:**
    * Star-forming region data from GF.
    * UGS for deterministic generation.
* **Output (consumed by):**
    * PlanetaryArchitect (PA): For detailed planet/moon generation.
    * CosmicObjectDatabase (COD): For storage and spatial queries.
    * QuantumLeap Renderer: For visual representation.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify deterministic generation of star systems from identical seeds and UGS.
    * Test stellar and planetary property assignment.
* **Statistical Validation:**
    * Compare generated star/planet distributions to observed data (e.g., stellar mass function, planet occurrence rates).
* **Integration Tests:**
    * Ensure compatibility with PA and COD modules.
* **Visual Inspection:**
    * Render sample star systems for qualitative assessment.

## 6. Documentation

* Document the star and planet formation process, including models and algorithms used.
* Specify the format and structure of star system data output.
* Provide guidance for parameter tuning and extension.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** SN builds on galaxies from GF, creating the next level of structure.
* **Scientific Grounding:** Use astrophysical models and data for realism.
* **Finite Computation:** Generate only as needed, with LOD and efficient data structures.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 