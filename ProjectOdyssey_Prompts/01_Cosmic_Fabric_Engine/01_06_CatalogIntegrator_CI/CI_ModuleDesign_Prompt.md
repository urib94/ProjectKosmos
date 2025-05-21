# Prompt for Implementing: CatalogIntegrator (CI)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 6. `CatalogIntegrator (CI)`

## 1. Module Overview

**As per the Project Odyssey ArchitecturalBlueprint:**

* **Process:** Ingests real astronomical catalogs (Gaia, Hipparcos, SDSS, NASA Exoplanet Archive, etc.).
* **Logic:** Where real data exists (e.g., for Sol system, nearby stars, known exoplanets, specific galaxies), it overrides or seeds the procedural generation engines to ensure fidelity. Creates "bubbles" of reality within the procedurally generated universe. Smooth blending at boundaries is critical.
* **Output:** Integrated dataset used by other Fabric Engine modules.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the `CatalogIntegrator (CI)` module for Project Odyssey. This module is responsible for incorporating real-world astronomical data into the simulation, creating areas of known space that override or influence procedural generation.

1.  **Catalog Ingestion & Parsing:**
    * Develop parsers for various common astronomical catalog formats (e.g., CSV, TSV, FITS, VOTable - focus on text-based initially for simplicity, with FITS as a stretch goal for professional catalogs).
    * Support a configurable list of catalogs to be loaded at startup or on demand.
    * Handle large catalog files efficiently (streaming, partial loading if possible).
2.  **Data Mapping & Normalization:**
    * Map catalog data fields (e.g., stellar positions, proper motions, magnitudes, spectral types, exoplanet parameters, galaxy properties) to the internal data structures used by Project Odyssey's `CosmicObjectDatabase (COD)` and procedural generation modules (CM, GF, SN, PA).
    * Normalize units and coordinate systems (e.g., convert various magnitude systems to absolute luminosity, convert equatorial coordinates to a common Cartesian system for a specific epoch).
3.  **"Reality Bubble" Management:**
    * Define a mechanism to identify regions of space where catalog data should take precedence over procedural generation (the "reality bubbles"). This could be based on proximity to catalog objects or predefined volumes.
    * Implement logic for procedural generation modules (CM, GF, SN, PA) to query the CI:
        * Before generating an object at a given location, the procedural module checks if a catalog object exists there or nearby.
        * If a catalog object exists, its data is used directly.
        * If no catalog object exists, procedural generation proceeds.
4.  **Seeding Procedural Generation:**
    * Where catalog data is incomplete for a specific object (e.g., a star with known position and luminosity but no detailed planetary system), the available catalog data should be used to *seed* or constrain the relevant procedural generation module.
    * Example: For a catalog star, SN would use its known mass and metallicity to generate a plausible (but still procedural) planetary system, rather than generating a star from scratch.
5.  **Blending at Boundaries (Conceptual):**
    * While true seamless blending is highly complex, define a strategy to avoid jarring transitions between catalog-defined regions and purely procedural regions. This might involve:
        * Gradual falloff in the "influence" of catalog data.
        * Ensuring procedural generation near catalog boundaries uses parameters consistent with the local catalog population.
6.  **Data Prioritization & Conflict Resolution:**
    * If multiple catalogs provide data for the same object, implement a configurable prioritization scheme (e.g., prefer Gaia data for stellar positions over Hipparcos if both exist for a star).
    * Define how to handle conflicting data entries.
7.  **Update Mechanism (Future Consideration):**
    * Conceptually, how might the system handle updates to astronomical catalogs (new data releases)? This is likely an offline process but good to consider during design.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Libraries (Potential):**
    * CSV/TSV parsing libraries.
    * Libraries for astronomical coordinate transformations (e.g., Astropy via Python interop if allowed, or implement core transformations like FK5 to Galactic).
    * (Optional) CFITSIO for FITS file handling if implemented.
* **Data Structures:** Efficient structures for storing parsed catalog data temporarily and for querying (e.g., spatial indexing like k-d trees for fast lookups of catalog objects by position).
* **Performance:** Parsing large catalogs can be slow. Optimize for efficient loading and querying. Consider pre-processing catalogs into an internal binary format for faster startup.
* **Error Handling & Resilience:**
    * Robustly handle malformed catalog files or missing data fields. Log errors and skip problematic entries with warnings.
    * Define behavior if a catalog file specified in the configuration is not found.
* **Logging:**
    * Log the loading process for each catalog (number of entries parsed, errors encountered).
    * Log when catalog data overrides or seeds procedural generation.
* **Security Considerations:**
    * If catalogs are downloaded or loaded from untrusted sources (not generally recommended for core data), parsing should be secure against exploits (e.g., buffer overflows). Primarily, ensure robustness against malformed local files.

## 4. Integration Points

* **Input:**
    * Astronomical catalog files (various formats).
    * Configuration System: For list of catalogs to load, their paths, parsing rules, prioritization.
* **Interaction (provides data/services to):**
    * `CosmologicalModeler (CM)`: May check for large-scale structures defined in galaxy catalogs.
    * `GalacticForge (GF)`: Checks for catalog galaxies before procedural generation; uses catalog galaxy properties to seed generation.
    * `StellarNursery (SN)`: Checks for catalog stars/star systems; uses catalog stellar properties to seed planet formation.
    * `PlanetaryArchitect (PA)`: Checks for catalog exoplanets/moons; uses their known (often partial) properties to seed detailed generation.
    * `CosmicObjectDatabase (COD)`: Populated with objects derived from catalog data.

## 5. Testing Strategy

* **Unit Tests:**
    * Test parsers for each supported catalog format with sample (and intentionally malformed) data.
    * Verify data mapping and normalization logic (e.g., coordinate conversions, unit conversions).
    * Test conflict resolution and prioritization logic.
* **Integration Tests:**
    * Create a small test universe. Load a mini-catalog defining a few objects. Verify that:
        * Procedural generation modules correctly query CI and use catalog data where appropriate.
        * Objects in the `CosmicObjectDatabase (COD)` reflect the catalog data.
        * The renderer displays catalog objects correctly.
    * Test "reality bubble" boundaries: ensure procedural generation takes over correctly outside cataloged areas.
* **Data Validation:**
    * Compare positions and properties of well-known objects (e.g., Sol, Alpha Centauri, Andromeda Galaxy) generated via CI against established astronomical databases to ensure accuracy of ingestion and coordinate systems.

## 6. Documentation

* Document all supported catalog formats and the specific fields expected/parsed from each.
* Detail the data mapping and normalization rules.
* Explain the "reality bubble" concept and how procedural modules should interact with CI.
* Document the catalog prioritization and conflict resolution strategy.
* Provide instructions on how to add new catalogs to the system.
* List all external libraries used for catalog processing.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** CI allows for grounding parts of the vast procedural universe in known reality, enhancing realism.
* **Scientific Grounding:** Directly incorporates real scientific data, forming the most scientifically grounded parts of the simulation.
* **Finite Computation:** While catalogs can be large, CI processes them to provide specific, relevant data to procedural engines, avoiding redundant generation.