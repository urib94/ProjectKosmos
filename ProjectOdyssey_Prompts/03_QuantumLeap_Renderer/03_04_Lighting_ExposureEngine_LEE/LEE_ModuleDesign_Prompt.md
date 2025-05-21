# Prompt for Implementing: Lighting_ExposureEngine (LEE)

**Project:** Project Odyssey
**Pillar:** III. The QuantumLeap Renderer
**Module:** 4. Lighting_ExposureEngine (LEE)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Pipeline:** High Dynamic Range (HDR) rendering pipeline throughout.
* **Light Sources:** Support for multiple light sources (stars) with appropriate falloff and color temperature.
* **Exposure Control:** Dynamic auto-exposure adapting to scene brightness. Manual exposure controls.
* **Tone Mapping:** Advanced tone mapping algorithms (e.g., ACES) to map HDR to LDR.
* **Shadows:** Cascaded shadow maps for local scenes, potentially ray-traced shadows for high detail. Light travel time considerations for illumination.
* **First Principle Applied (Pillar III):** The engine must handle extreme dynamic range in scale and brightness. Accurate lighting is paramount.

## 2. Core Requirements & Functionality

You are to develop the Lighting_ExposureEngine (LEE) module for Project Odyssey. This module is responsible for managing all aspects of lighting, exposure, and tone mapping to produce a visually coherent and realistic image from the HDR scene data.

1.  **HDR Rendering Pipeline:**
    * Ensure the entire rendering pipeline operates in HDR (e.g., using floating-point framebuffers like RGBA16F or RGBA32F).
    * All lighting calculations should be performed in linear color space.
2.  **Light Source Management:**
    * **Primary Light Sources (Stars):**
        * Identify dominant light sources (stars) affecting the current scene, likely from CosmicObjectDatabase (COD) and StellarEvolutionEngine (SEE).
        * For each star, retrieve its luminosity, color temperature (for light color), radius, and position.
        * Handle potentially thousands or millions of distant stars by using an efficient representation for their aggregate illumination (e.g., image-based lighting from a dynamic skybox, or a few dominant local stars + ambient term).
    * **Secondary Light Sources (Optional):** Emissive surfaces (e.g., lava, cities on planets, spacecraft engines) if they are significant enough to cast light.
    * **Light Properties:** Model realistic light falloff (inverse square law).
3.  **Shadow Rendering:**
    * **Cascaded Shadow Maps (CSMs):** For dominant directional lights (like a local star) in planetary-scale or local scenes to provide detailed shadows with good resolution distribution.
    * **Omnidirectional Shadow Maps (Cubemaps):** For point lights if needed (e.g., a nearby bright star casting shadows in multiple directions).
    * **Soft Shadows:** Implement techniques for soft shadows (e.g., Percentage-Closer Soft Shadows - PCSS, Variance Shadow Maps - VSM, or ray-traced soft shadows if feasible).
    * **Shadow Map Caching/Updating:** Efficiently update shadow maps only when lights or shadow-casting geometry change significantly.
    * **Light Travel Time for Shadows (Conceptual - Very Advanced):** If a shadow-casting object is very distant from what it's casting a shadow on, the light travel time could mean the shadow is cast by a "past" version of the object. This is highly complex and likely out of scope for initial implementation but is a long-term consideration for extreme realism.
4.  **Ambient Lighting:**
    * Implement an ambient lighting solution to simulate indirect illumination:
        * **Image-Based Lighting (IBL):** Use dynamically generated or pre-computed cubemaps of the surrounding environment (skybox, distant galaxies, nebulae) to provide ambient diffuse and specular lighting.
        * **Screen Space Ambient Occlusion (SSAO) / Horizon Based Ambient Occlusion (HBAO):** To add contact shadows and enhance visual depth.
5.  **Dynamic Auto-Exposure:**
    * Calculate average scene luminance from the HDR framebuffer (e.g., by downsampling or using a compute shader to generate a histogram).
    * Adapt camera exposure dynamically to match a target brightness level, simulating human eye adaptation.
    * Provide parameters for controlling adaptation speed, min/max exposure.
    * Allow user to override with manual exposure settings.
6.  **Tone Mapping:**
    * Implement one or more advanced tone mapping operators to convert the HDR scene-referred image to an LDR display-referred image suitable for monitors.
    * **Recommended Operators:** ACES (Academy Color Encoding System) for filmic and color-accurate results, Uncharted 2, Reinhard, etc. Make it selectable.
    * Apply gamma correction as the final step if outputting to sRGB displays.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Graphics API:** Vulkan, DirectX 12.
* **Shader Development:** Significant shader work for lighting calculations, shadow map generation, SSAO, tone mapping.
* **Performance Considerations:**
    * Shadow map generation can be expensive. Optimize by minimizing draw calls into shadow maps and using appropriate shadow map resolutions.
    * Full global illumination is too expensive for real-time; IBL and SSAO are approximations.
    * Auto-exposure histogram generation and tone mapping should be efficient post-processing passes.
* **Error Handling & Resilience:**
    * Handle cases with no dominant light sources (e.g., deep intergalactic space - fall back to pure ambient from CBR).
* **Logging:**
    * Log selected exposure and tone mapping settings.
    * Log performance of shadow map generation if it becomes a bottleneck.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * SceneGraph_MultiScaleCoordinateSystem (SMCS): For geometry information needed for shadow casting and receiving.
    * CosmicObjectDatabase (COD) & StellarEvolutionEngine (SEE): For properties of light sources (stars).
    * CosmicBackgroundRenderer (CBR): For skybox cubemaps used in Image-Based Lighting.
    * Explorer's Interface (UCVC): For camera parameters.
    * PostProcessingStack (PPS): Exposure and tone mapping are typically late stages in the post-processing stack.
    * Configuration System: For default lighting parameters, shadow quality settings, tone mapper choice.
* **Output (contributes to/modifies):**
    * The final rendered image by applying lighting, shadows, exposure, and tone mapping.
    * Provides lighting environment data (e.g., matrices for shadow mapping, IBL cubemaps) to the PhysicallyBasedShaderLibrary (PBSL) for material shading.

## 5. Testing Strategy

* **Unit Tests:**
    * Test individual lighting calculations (e.g., diffuse, specular for a given light and material).
    * Verify shadow map projection/sampling math.
    * Test tone mapping operators with known HDR input values and verify LDR output.
* **Visual Validation:**
    * Render test scenes with various lighting conditions:
        * Single dominant star, multiple stars.
        * Objects with complex self-shadowing.
        * Scenes with extreme brightness variations to test auto-exposure and tone mapping.
    * Compare against reference images from PBR renderers or real photographs (where analogous).
    * Verify shadow quality (resolution, softness, lack of artifacts like aliasing or Peter-Panning).
    * Ensure IBL and SSAO contribute realistically to ambient lighting.
* **Performance Tests:**
    * Measure frame time cost of different shadow map resolutions, CSM cascade counts, and SSAO quality settings.
    * Benchmark auto-exposure and tone mapping passes.
* **Comparative Tests:**
    * If multiple tone mapping operators are implemented, compare their visual output and allow for A/B testing.

## 6. Documentation

* Document the overall HDR lighting pipeline.
* Detail the types of light sources supported and their properties.
* Explain the shadow rendering techniques used (CSM, etc.) and their parameters.
* Describe the ambient lighting model (IBL, SSAO).
* Document the auto-exposure and tone mapping algorithms and their configurable settings.
* Provide guidance on how artists/designers can set up lighting and materials for optimal results.

## 7. Adherence to Project Principles

* **Scientific Grounding:** Light properties (color temperature, falloff) based on physics. Tone mapping (like ACES) aims for color fidelity.
* **Active Observation:** Auto-exposure simulates eye adaptation, directly impacting what the user perceives in varying light conditions.
* **Finite Computation:** Uses techniques like CSM, IBL, and SSAO as efficient approximations for complex global light transport and shadowing.
* **Hierarchical & Scalable Universe:** Must handle lighting from single nearby stars to the faint glow of distant galaxies contributing to ambient light.
