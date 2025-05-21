# Prompt for Implementing: SceneGraph_MultiScaleCoordinateSystem (SMCS)

**Project:** Project Odyssey
**Pillar:** III. The QuantumLeap Renderer
**Module:** 1. SceneGraph_MultiScaleCoordinateSystem (SMCS)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Scene Graph:** Manages all renderable entities in a hierarchical tree structure, tightly coupled with the CosmicObjectDatabase (COD).
* **Multi-Scale Coordinates:** Implements robust handling of extreme coordinate ranges using techniques like camera-relative rendering, scaled scene contexts (e.g., units are meters on a planet, AUs in a solar system, parsecs in a galaxy), and double precision for key positional data (converted or emulated for GPU as needed).
* **Culling:** Frustum culling, occlusion culling (e.g., using Hi-Z or software rasterization), distance-based culling.
* **First Principle Applied (Pillar III):** The engine must handle extreme dynamic range in scale and brightness, and vast distances.

## 2. Core Requirements & Functionality

You are to develop the SceneGraph_MultiScaleCoordinateSystem (SMCS) module for Project Odyssey. This module is foundational for organizing and rendering objects across the vast scales of the simulated universe while maintaining numerical precision.

1.  **Hierarchical Scene Graph:**
    * Implement a scene graph capable of representing hierarchical relationships between renderable objects (e.g., moons around planets, planets around stars, solar systems within sectors of a galaxy).
    * Nodes in the scene graph should store transformations (position, rotation, scale) relative to their parent.
    * Efficiently compute world-space transformations for rendering.
2.  **Multi-Scale Coordinate System Management:**
    * **Camera-Relative Rendering:** Implement rendering where world coordinates are transformed to be relative to the camera's position *before* being passed to the GPU. This keeps vertex coordinates within loat precision limits for objects near the camera.
    * **Scaled Scene Contexts / Floating Origin:** Develop a system of nested coordinate frames or "scaled contexts." As the camera moves across vast distances, the origin of the primary rendering coordinate system can shift, or the scale of units can change, to prevent precision loss for distant objects. For example:
        * **Local Context (e.g., planetary surface):** Units in meters. High precision for local detail.
        * **System Context (e.g., solar system):** Units in Astronomical Units or scaled km.
        * **Galactic Context:** Units in parsecs or light-years.
    * Define clear rules and mechanisms for transitioning objects and the camera between these contexts.
    * Manage the use of double precision for storing authoritative global positions (e.g., from CosmicObjectDatabase) and converting them accurately to the appropriate loat-based rendering context.
3.  **Renderable Object Representation:**
    * Define a base Renderable object or component that can be part of the scene graph. It should interface with the LevelOfDetail_Subsystem (LODS) to select appropriate meshes/materials.
    * Store references to geometry, materials, textures, and other rendering-specific data.
4.  **Culling Mechanisms:**
    * **View Frustum Culling:** Efficiently cull objects outside the camera's view frustum.
    * **Occlusion Culling:** Implement techniques to cull objects occluded by other opaque objects (e.g., Hierarchical Z-Buffer (Hi-Z), Software Rasterizer with Occlusion Queries, or hardware occlusion queries). Evaluate trade-offs.
    * **Distance-Based Culling:** Cull small or insignificant objects beyond a certain distance, even if within the frustum. This will be configurable and interact with LODS.
    * **Sector/Cell-Based Culling:** Leverage the spatial organization of CosmicObjectDatabase (COD) (e.g., Octree) to perform coarse-grained culling of entire regions/sectors.
5.  **Integration with LODS and COD:**
    * SMCS nodes should be aware of their corresponding object in the CosmicObjectDatabase (COD) to fetch properties.
    * SMCS must work closely with LevelOfDetail_Subsystem (LODS) to determine which version of an object's model/representation to render. The scene graph might store multiple LOD representations or query LODS.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Graphics API:** Vulkan, DirectX 12 (as per project choice).
* **Data Structures:** Tree structures for scene graph, bounding volume hierarchies (BVHs) for culling acceleration.
* **Mathematical Libraries:** Robust libraries for 3D math (vectors, matrices, quaternions) supporting both loat and double precision (e.g., GLM, Eigen).
* **Performance Considerations:**
    * Scene graph traversal and transformation updates must be highly optimized.
    * Culling algorithms must be efficient to avoid becoming a bottleneck.
    * Minimize CPU-GPU data transfer related to transformations and object visibility. Consider techniques like GPU scene graphs or culling on the GPU.
* **Numerical Precision:**
    * Rigorously manage conversions between double precision world states and loat precision rendering states. Document potential precision issues and mitigation strategies.
* **Error Handling & Resilience:**
    * Handle invalid transformations or scene graph states gracefully.
    * Manage cases where objects might be missing required rendering components.
* **Logging:**
    * Log statistics on culled objects (e.g., "X objects frustum culled, Y objects occlusion culled").
    * Log transitions between scaled scene contexts or floating origin shifts.
    * Log errors related to invalid scene graph operations or precision issues.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * CosmicObjectDatabase (COD): Provides the authoritative list of existing celestial objects, their global positions, orientations, and relationships. SMCS creates/updates its renderable representations based on COD.
    * Explorer's Interface (UCVC): For camera position, orientation, and frustum parameters.
    * LevelOfDetail_Subsystem (LODS): For information about which LOD representation of an object to use.
* **Output (provides data/services to):**
    * The Graphics API Command Buffer: Ultimately, SMCS determines the list of visible objects and their transformations, which are then used to generate rendering commands.
    * Lighting_ExposureEngine (LEE): May need scene graph information for light source management or shadow rendering.
    * Other rendering modules that need to iterate over visible objects or query scene structure.

## 5. Testing Strategy

* **Unit Tests:**
    * Test scene graph operations: node addition/removal, parent-child relationships, local/world transformation calculations.
    * Test individual culling algorithms (frustum, distance) with known object configurations.
    * Verify coordinate system transformations and precision handling between double (world) and loat (render) states.
    * Test camera-relative rendering math.
* **Visual Tests:**
    * Render scenes with many objects and verify that culling works correctly (objects disappear when outside frustum or occluded).
    * Move the camera across vast distances and verify that there are no visible jittering artifacts due to precision loss, confirming multi-scale coordinate system is working.
    * Inspect object transformations to ensure they are correct relative to their parents and world space.
* **Performance Tests:**
    * Benchmark scene graph traversal and culling performance with varying numbers of objects (thousands to millions).
    * Measure impact of different occlusion culling techniques.
* **Integration Tests:**
    * Ensure objects from COD are correctly represented and updated in the scene graph.
    * Verify that LODS appropriately influences which mesh/material is selected by the SMCS for a renderable object.
    * Confirm that camera movements from UCVC correctly update the view frustum and culling results.

## 6. Documentation

* Document the scene graph structure and node types.
* Detail the multi-scale coordinate system strategy, including how camera-relative rendering and scaled contexts/floating origin are implemented.
* Explain the different culling algorithms used and their configuration.
* Provide comprehensive documentation for SMCS's API (how objects are added/managed, how transformations are handled).
* Document strategies for maintaining numerical precision.
* Explain how SMCS interacts with COD and LODS.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** The scene graph mirrors the hierarchical nature of the universe, and the multi-scale coordinate system is essential for handling its vast scales.
* **Finite Computation:** Efficient culling is critical for ensuring that only potentially visible objects are processed for rendering, managing computational load.
* **Active Observation:** The camera's position and orientation (driven by the user) are central to all culling and coordinate system operations.
* **Modularity:** SMCS provides a core rendering structure that other rendering modules build upon.
