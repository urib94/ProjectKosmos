# Prompt for Implementing: UniverseGenesisSeed (UGS)

**Project:** Project Kósmos
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 1. `UniverseGenesisSeed (UGS)`

## 1. Module Overview

**As per the Project Kósmos Architectural Blueprint:**

*   **Description:** A single, master seed value (e.g., 64-bit or 128-bit integer) from which all deterministic procedural generation originates.
*   **Output:** Allows for shareable and reproducible universes.
*   **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the `UniverseGenesisSeed (UGS)` module for Project Kósmos. This module is foundational for the entire simulation's determinism and reproducibility.

1.  **Seed Definition and Storage:**
    *   Implement a mechanism to define, store, and manage a master seed value.
    *   The seed should be a configurable integer type, ideally 64-bit (e.g., `uint64_t`) or 128-bit (e.g., `u128`).
    *   Provide methods for initializing the seed (e.g., from user input, random generation with display, fixed value for scenarios, configuration file).
2.  **Seed Accessibility & API:**
    *   Design and implement a clear, efficient, and thread-safe API for other modules to access the master seed.
    *   This API will be primarily consumed by other modules within the Cosmic Fabric Engine (e.g., `CosmologicalModeler`, `GalacticForge`, `StellarNursery`, `PlanetaryArchitect`).
3.  **Reproducibility:**
    *   The core design goal is to ensure that utilizing the same UGS, in conjunction with identical versions of procedural generation algorithms and their parameters, consistently and reliably produces the exact same universe or universe component.
4.  **Shareability:**
    *   The UGS must be easily exportable (e.g., to a string or numerical format) and importable. This allows users to share specific, reproducible universe instances.
5.  **Seed Derivation (Recommended):**
    *   Implement a hierarchical seed derivation mechanism. Instead of all modules or procedural generation instances directly using the single master seed, they should derive unique, deterministic sub-seeds from the UGS.
    *   This approach helps isolate random number streams for different parts of the generation process, preventing unintended correlations if modules are modified, reordered, or parallelized.
    *   Example: `derive_seed_for_module(module_name: string, instance_id: uint64) -> DerivedSeedType`. This function must be deterministic.

## 3. Technical Stack & Implementation Details

*   **Primary Language:** C++ or Rust (Adhere to overall project choice).
*   **Data Types:** Utilize appropriate large integer types for the seed (e.g., `uint64_t`, `std::uintmax_t` in C++; `u64`, `u128` in Rust). Consider cross-platform compatibility if serializing.
*   **Configuration:** Detail how the UGS is set or loaded at simulation startup (e.g., configuration file, command-line argument, default value).
*   **Random Number Generation (PRNG) Context:**
    *   The UGS module itself provides the *master* seed. It does not perform random number generation.
    *   Modules consuming the UGS (or derived seeds) will use these seeds to initialize their own PRNG instances (e.g., Xorshift, PCG, Mersenne Twister). The choice of PRNGs in consuming modules should be consistent for reproducibility.

## 4. Integration Points

*   **Key Consumers:**
    *   `CosmologicalModeler (CM)`: Uses UGS to seed generation of large-scale structures.
    *   `GalacticForge (GF)`: Uses UGS (or derived seed) for procedural galaxy generation.
    *   `StellarNursery (SN)`: Uses UGS (or derived seed) for star system and protoplanetary disk generation.
    *   `PlanetaryArchitect (PA)`: Uses UGS (or derived seed) for detailed planet/moon property generation.
*   **Proposed API (Illustrative):**
    *   `void set_master_seed(SeedType new_seed);`
    *   `SeedType get_master_seed() const;`
    *   `bool is_master_seed_set() const;`
    *   `SeedType derive_seed(const char* context_name, uint64_t specific_identifier) const;` (Deterministic derivation)
    *   `std::string export_seed_to_string() const;`
    *   `bool import_seed_from_string(const std::string& seed_str);`

## 5. Testing Strategy

*   **Unit Tests:**
    *   Verify correct setting and retrieval of the master seed.
    *   Test that different UGS values are distinct and handled correctly.
    *   Validate the seed derivation mechanism:
        *   Ensure derived seeds are deterministic (same inputs always produce the same derived seed).
        *   Ensure different inputs (context_name, specific_identifier) produce different derived seeds.
    *   Test serialization (export) and deserialization (import) of the seed, ensuring data integrity.
    *   Test edge cases for seed values (e.g., 0, max value).
*   **Integration Tests (as part of downstream module testing):**
    *   The primary integration test for UGS is validating reproducibility in modules that consume it. For any module X that uses the UGS:
        *   Given a fixed UGS and fixed parameters for module X, the output of module X must be identical across multiple runs.
        *   This will form part of the test suites for CM, GF, SN, PA, etc.
*   **Reproducibility Test (System-Level):**
    *   Define a scenario for generating a minimal, well-defined part of the universe (e.g., a single star system with specific properties).
    *   Run the generation, save the UGS used.
    *   In a new simulation instance, load the saved UGS and re-run the generation.
    *   Verify that the resulting universe component is bit-for-bit identical or functionally identical according to defined metrics.

## 6. Documentation

*   Clearly document the UGS format, its range, and its critical role in the simulation.
*   Provide comprehensive documentation for the API, including how to set, get, and derive seeds.
*   Explain the importance of the UGS for reproducibility, shareability, and debugging in the project's overall technical documentation.
*   Document the chosen seed derivation strategy.

## 7. Adherence to Project Principles

*   **Hierarchical & Scalable Universe:** The UGS is the singular origin point from which the vast, hierarchical universe is deterministically generated.
*   **Modularity:** The UGS module must be a clean, well-defined, and independent component with a stable API.
*   **Finite Computation:** The UGS itself is a small piece of data that enables the generation of immense complexity without storing it all.
*   **Scientific Grounding:** While the UGS is a technical component, its correct application enables the consistent generation of scientifically plausible structures by downstream modules. 