# Prompt for Implementing: CatalogIntegrator (CI)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 6. CatalogIntegrator (CI)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Process:** Ingests, parses, and normalizes data from real astronomical catalogs (e.g., Gaia for stars, Hipparcos, SDSS for galaxies, NASA Exoplanet Archive, IAU Minor Planet Center).
* **Logic:**
    * Where real data exists, it overrides or seeds the procedural generation engines. This creates "bubbles" of reality within the procedurally generated universe (e.g., the Sol system, known exoplanetary systems, well-studied nearby galaxies).
    * Ensures smooth blending and transitions between catalog data and procedural content at the boundaries of these "reality bubbles."
    * Validates catalog data against physical plausibility where possible.
* **Output:** Integrated dataset used by other Fabric Engine modules.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the CatalogIntegrator (CI) module for Project Odyssey. This module is responsible for integrating real astronomical data with procedural content.

1.  **Catalog Ingestion:**
    * Support ingestion of multiple astronomical catalogs (stars, galaxies, exoplanets, minor bodies).
    * Parse, normalize, and validate catalog data.
2.  **Reality Bubble Creation:**
    * Where catalog data exists, override or seed procedural generation to create "bubbles" of reality.
    * Ensure seamless blending at the boundaries between real and procedural data.
3.  **Data Validation:**
    * Validate catalog data for physical plausibility and consistency.
    * Handle missing or uncertain data gracefully.
4.  **Integration with Procedural Modules:**
    * Provide interfaces for procedural modules to query catalog data and determine when to use real vs. generated content.
5.  **Output Definition:**
    * Output an integrated dataset for use by other modules (COD, Renderer, etc.).
6.  **Scalability & Performance:**
    * Efficiently handle large catalogs and on-demand data access.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Efficient representations for catalog entries and integrated objects.
* **Algorithmic Choices:**
    * Use robust parsing, normalization, and validation routines.
    * Allow for configuration of catalog priorities and blending rules.
* **Configuration:**
    * Allow for catalog selection and blending parameters via configuration files.

## 4. Integration Points

* **Input:**
    * Astronomical catalogs (various formats).
* **Output (consumed by):**
    * CosmicObjectDatabase (COD): For storage and spatial queries.
    * Procedural modules: For seeding/overriding generation.
    * QuantumLeap Renderer: For visual representation.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct parsing and normalization of catalog data.
    * Test blending and override logic.
* **Integration Tests:**
    * Ensure compatibility with procedural modules and COD.
* **Validation:**
    * Compare integrated data to known astronomical properties and distributions.

## 6. Documentation

* Document the catalog ingestion and integration process.
* Specify the format and structure of integrated data output.
* Provide guidance for adding new catalogs and tuning blending rules.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** CI enables the coexistence of real and procedural content.
* **Scientific Grounding:** Use real data where available, validated for plausibility.
* **Finite Computation:** Efficiently handle large datasets and blend with procedural content.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 