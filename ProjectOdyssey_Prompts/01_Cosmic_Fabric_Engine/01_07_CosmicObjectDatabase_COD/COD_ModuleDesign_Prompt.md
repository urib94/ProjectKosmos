# Prompt for Implementing: CosmicObjectDatabase (COD)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 7. `CosmicObjectDatabase (COD)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Storage:** An in-memory and on-disk adaptive spatial data structure (e.g., a dynamic Octree or k-d tree variant per scale: Universe -> Galaxy Cluster -> Galaxy -> Star System -> Planet Surface).
* **Function:** Stores the state of all instantiated objects (both catalog-based and procedurally generated). Handles dynamic loading/unloading of regions based on observer proximity and detail level. Stores object properties, evolutionary state, and relationships.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the `CosmicObjectDatabase (COD)` module for Project Odyssey. This module serves as the central repository for all instantiated celestial objects and their states within the simulation, whether generated procedurally or loaded from catalogs.

1.  **Object Representation:**
    * Define a flexible and extensible data structure for representing celestial objects (e.g., stars, planets, moons, galaxies, nebulae, black holes, etc.). This structure must accommodate diverse properties from various sources (procedural modules, catalogs).
    * Support hierarchical relationships (e.g., moons orbiting planets, planets orbiting stars, stars within galaxies).
2.  **Spatial Indexing:**
    * Implement a hierarchical, adaptive spatial indexing scheme (e.g., nested Octrees, k-d trees, or a hybrid approach) to organize objects across all scales (from planetary surfaces to superclusters).
    * The indexing scheme must support efficient spatial queries:
        * Range queries (find all objects within a given volume/bounding box).
        * Nearest neighbor queries.
        * Ray-casting queries (find objects intersecting a ray – primarily for selection/interaction).
3.  **Dynamic Loading/Unloading (Streaming):**
    * Develop a system for dynamically loading object data into memory as the observer (player) moves through the universe, and unloading data for distant/non-visible regions to manage memory usage.
    * This system will interact closely with the `QuantumLeap Renderer (LODS)` and `Explorer's Interface (UCVC)` to determine which regions are currently relevant.
    * Procedural generation modules (CM, GF, SN, PA) will be triggered by this system to generate details for newly relevant regions if not already present or loaded from disk.
4.  **State Management:**
    * Store and manage the current state of objects, including their physical properties, orbital elements, and evolutionary state (e.g., current age of a star, phase of a variable star).
    * Interact with the `TemporalIndexer (TI)` to retrieve or update object states based on the simulation time `t_sim`.
5.  **Persistence (Save/Load Game State):**
    * Implement mechanisms to serialize the state of instantiated objects (especially those modified by player interaction or significant procedural events) to disk for saving game state.
    * Implement mechanisms to deserialize and restore this state when loading a saved game.
    * This should focus on changes and unique procedural outputs linked to a specific UGS, not on re-saving entire catalogs.
6.  **API for Object Access & Modification:**
    * Provide a clear and efficient API for other modules to:
        * Add new objects to the database.
        * Query for objects based on various criteria (ID, name, type, spatial location).
        * Retrieve object properties.
        * Update object states (e.g., by physics engine, stellar evolution engine).
        * Remove objects (e.g., if a star goes supernova and is replaced by a remnant).
    * Ensure thread-safety if accessed by multiple threads (e.g., physics thread updating, render thread querying).
7.  **Unique Object Identification:**
    * Implement a robust system for assigning unique, persistent identifiers to all objects, especially those generated procedurally, to allow consistent referencing across sessions and save/load cycles (potentially combining UGS, path in procedural hierarchy, and an instance ID).

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Data Structures:** Octrees, k-d trees, hash maps (for ID lookups), custom object-oriented hierarchies or Entity-Component-System (ECS) architecture for object properties. Consider ECS for flexibility and performance.
* **Serialization Format:** Choose an efficient and extensible serialization format for saving/loading (e.g., Protocol Buffers, FlatBuffers, custom binary format, JSON for human-readable parts if needed).
* **Performance:**
    * Spatial queries must be highly optimized.
    * Object lookup by ID should be very fast.
    * Memory management is critical; avoid fragmentation and excessive allocations. Object pooling might be beneficial.
* **Error Handling & Resilience:**
    * Handle cases of corrupted save data during loading.
    * Manage out-of-memory conditions gracefully if dynamic loading becomes too aggressive.
    * Ensure data integrity for object properties.
* **Logging:**
    * Log major database operations: loading/unloading of large regions, saving/loading game state, addition/removal of significant objects.
    * Log errors during queries or data modification.
* **Security Considerations (Primarily Data Integrity):**
    * Ensure robustness of deserialization process against corrupted or malformed save files to prevent crashes or exploits (if save files could ever come from untrusted sources, though typically user-generated).

## 4. Integration Points

* **Input (receives data from/is populated by):**
    * `UniverseGenesisSeed (UGS)`: Used in generating unique IDs for procedural objects.
    * `CosmologicalModeler (CM)`: Stores LSS data if represented as discrete objects/regions.
    * `GalacticForge (GF)`: Stores generated galaxy definitions.
    * `StellarNursery (SN)`: Stores generated star system definitions.
    * `PlanetaryArchitect (PA)`: Stores detailed planet/moon definitions.
    * `CatalogIntegrator (CI)`: Stores objects derived from real astronomical catalogs.
    * Save/Load System: For restoring persisted state.
* **Output (provides data/services to):**
    * `TemporalIndexer (TI)`: For querying current states of objects to evolve them.
    * `AstroDynamicsEngine`: For retrieving object properties (mass, position, velocity) for physics calculations.
    * `QuantumLeap Renderer`: For retrieving object data (position, orientation, model references, material properties, LOD hints) for rendering.
    * `Explorer's Interface`: For object selection, information display, map population.
    * `Oracle AI`: For retrieving contextual information about objects for the LLM.
    * Save/Load System: For persisting current state.

## 5. Testing Strategy

* **Unit Tests:**
    * Test object creation, retrieval (by ID, by spatial query), update, and deletion.
    * Verify spatial indexing: ensure correct results for range queries, nearest neighbor searches.
    * Test hierarchical relationships between objects.
    * Test serialization and deserialization of various object types and database states.
    * Verify unique ID generation and consistency.
* **Performance Tests:**
    * Benchmark spatial query performance with varying numbers of objects and query complexities.
    * Measure memory usage under different load conditions (e.g., dense star cluster vs. sparse intergalactic void).
    * Test save/load times for large game states.
* **Stress Tests:**
    * Populate the database with a very large number of objects to test scalability and stability.
    * Simulate rapid observer movement to test dynamic loading/unloading performance.
* **Integration Tests:**
    * Verify that objects created by procedural modules (GF, SN, PA) and CI are correctly stored and retrievable.
    * Ensure the renderer can access and display objects from the COD correctly.
    * Test save/load functionality: save a game state, load it, and verify that the universe is restored accurately.

## 6. Documentation

* Document the internal object representation and schema.
* Detail the spatial indexing algorithm(s) used and their performance characteristics.
* Provide comprehensive documentation for the COD's public API.
* Explain the dynamic loading/unloading strategy and its interaction with procedural generation.
* Document the save/load game file format.
* Explain the object identification system.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** The COD is designed to manage objects across all scales using hierarchical spatial indexing.
* **Evolving Matter & Energy:** Stores the *current* state of evolving objects.
* **Finite Computation:** Dynamic loading/unloading and efficient querying are key to managing vast amounts of potential data with finite memory and CPU.
* **Modularity:** Provides a central, well-defined interface for all other systems to access and manage universe object data.