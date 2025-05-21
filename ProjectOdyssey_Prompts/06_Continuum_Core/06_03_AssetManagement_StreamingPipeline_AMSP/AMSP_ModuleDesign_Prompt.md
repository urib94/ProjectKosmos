# Prompt for Implementing: AssetManagement_StreamingPipeline (AMSP)

**Project:** Project Odyssey
**Pillar:** VI. The Continuum Core
**Module:** 3. AssetManagement_StreamingPipeline (AMSP)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To catalog, dynamically stream, compress, and cache all project assets (textures, models, audio, data) efficiently based on real-time requirements.
* **Asset Database:** Catalogs all project assets (textures, 3D models, shaders, sound files, data tables, scripts), including metadata (versions, dependencies, LOD variants).
* **Dynamic Streaming:** Intelligently streams assets from disk (or network for future cloud-based versions) into memory based on real-time requirements determined by observer proximity, viewing frustum, LODS requests, and predictive algorithms.
* **Prioritization:** Prioritizes asset loading to minimize pop-in and ensure critical assets for the immediate view are loaded first.
* **Compression:** Utilizes efficient runtime compression formats for textures (ASTC, BCn, ETC2), meshes (Draco, glTF with compression), and data (Zstandard, LZ4, custom binary).
* **Caching:** Implements multi-level caching (in-memory GPU, in-memory CPU, on-disk) for frequently accessed assets.
* **First Principle Applied (Pillar VI):** Robustness, performance, and maintainability are paramount for a project of this complexity. Systems must be designed for efficiency and scalability from the outset.

## 2. Core Requirements & Functionality

You are to develop the AssetManagement_StreamingPipeline (AMSP) module for Project Odyssey. This system is critical for managing the vast amounts of data required by the simulation without exhausting system resources.

1.  **Asset Database and Metadata:**
    * Implement a system to catalog all assets, storing metadata: type, path, dependencies, LOD variants, compression format, size, version.
    * Support for asset tagging and searching.
2.  **Asynchronous Asset Streaming:**
    * Develop an asynchronous pipeline for loading assets from disk or network.
    * Integrate with the HighPerformanceComputingCore (HPCC) for parallel decompression and processing of assets.
3.  **Streaming Prioritization and Scheduling:**
    * Implement algorithms to prioritize asset loading based on observer proximity, view frustum, LOD requirements, and potentially predictive loading.
    * Manage a request queue for asset loading.
4.  **Compression and Decompression:**
    * Integrate libraries and implement routines for handling various compression formats (textures, meshes, data) specified in the architecture.
5.  **Multi-Level Caching:**
    * Design and implement caching layers:
        * On-disk cache for downloaded/processed assets.
        * In-memory CPU cache for frequently used raw asset data.
        * In-memory GPU cache (managed by renderer) for textures, meshes ready for rendering.
    * Implement cache eviction policies (e.g., LRU, LFU).
6.  **Asset Referencing and Management:**
    * Implement a robust system for referencing assets (e.g., by unique ID or path).
    * Handle asset dependencies (e.g., a model needing specific textures and materials).
    * Manage asset lifetimes and reference counting to unload unused assets.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **File I/O:** Efficient asynchronous file I/O operations.
* **Compression Libraries:** Zlib, Zstandard, LZ4, basis_universal (for textures), Draco (for meshes).
* **Data Structures:** Hash maps for asset lookup, priority queues for streaming requests, custom structures for asset metadata.
* **Database (Optional for Catalog):** SQLite or a simple file-based database for the asset catalog if it becomes very large or requires complex queries.
* **Networking (Future):** Consider APIs for HTTP/S for potential cloud-based asset delivery.

## 4. Integration Points

* **Consumed By:**
    * QuantumLeap Renderer: Requests textures, models, shaders.
    * AudioEngine (AE): Requests sound files.
    * CosmicFabric Engine / CosmicObjectDatabase (COD): May request procedural generation rules, data tables, or other data assets.
    * Explorer's Interface (UIE): Requests UI textures, fonts.
* **Depends On:**
    * HighPerformanceComputingCore (HPCC): For parallel decompression and processing tasks.
    * ModularArchitecture_APILayer (MAAL): For API definitions.
* **Interacts With:**
    * LevelOfDetail_Subsystem (LODS): To determine which asset variants to stream.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct loading and parsing of asset metadata.
    * Test individual compression/decompression routines for various asset types.
    * Test caching logic (add, retrieve, evict).
    * Test asset reference counting and unloading.
* **Streaming Tests:**
    * Simulate various scenarios of observer movement and asset requests to test prioritization and streaming behavior.
    * Measure asset loading times and identify bottlenecks.
* **Stress Tests:**
    * Load a large number of diverse assets simultaneously to test system stability and resource usage.
    * Test cache performance under high load.
* **Visual/Functional Tests:**
    * Ensure that streamed assets are correctly rendered and utilized by the respective systems (e.g., textures appear correctly on models).

## 6. Documentation

* Documentation of the asset pipeline, including how assets are imported, processed, cataloged, and streamed.
* Specifications for supported asset formats and compression schemes.
* Guides for artists and designers on preparing assets for the simulation.
* API documentation for requesting and managing assets.
* Details on the caching mechanisms and how to configure them.

## 7. Adherence to Project Principles

* **Performance:** Crucial for smooth experience, minimizing pop-in and load times.
* **Scalability:** Must handle a vast library of assets for a universe-scale simulation.
* **Finite Computation:** Only loads what is necessary, unloads what is not.
* **Robustness:** Graceful handling of missing assets or I/O errors.

