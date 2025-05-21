# Prompt for Implementing: PhysicallyBasedShaderLibrary (PBSL)

**Project:** Project Odyssey
**Pillar:** III. The QuantumLeap Renderer
**Module:** 3. PhysicallyBasedShaderLibrary (PBSL)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Content:**
    * **Core:** Physically Based Rendering (PBR) materials for surfaces (planets, ships, etc.).
    * **Atmospheric Scattering:** Rayleigh, Mie, multiple scattering models for planetary atmospheres.
    * **Stellar Shaders:** Procedural surfaces, limb darkening, coronas, flares.
    * **Nebula Shaders:** Volumetric rendering using raymarching.
    * **Galaxy Shaders:** Particle systems and volumetric rendering/impostors.
    * **Black Hole Lensing Shader:** Ray tracing in pixel shader or mesh distortion.
    * **Accretion Disk Shaders:** Glowing, differentially rotating disks with Doppler effects.
    * **Relativistic Effects Shaders:** (Optional) Red/Blue shift, aberration.
* **First Principle Applied (Pillar III):** The engine must handle extreme dynamic range in scale and brightness. Specialized shaders are key.

## 2. Core Requirements & Functionality

You are to develop the PhysicallyBasedShaderLibrary (PBSL) module for Project Odyssey. This module will contain a comprehensive collection of shaders required to render the diverse celestial objects and phenomena with scientific plausibility and visual appeal.

1.  **Core PBR Surface Shader:**
    * Implement a robust PBR shader supporting either Metal/Roughness or Specular/Glossiness workflows (choice to be consistent across project).
    * Inputs: Albedo, Normal, Metallic, Roughness, Ambient Occlusion, Emissive maps.
    * Support for various texture inputs and material parameters.
    * Used for planets, moons, asteroids, spacecraft, man-made structures.
2.  **Atmospheric Scattering Shader(s):**
    * Implement shaders for rendering planetary atmospheres from space and from within (ground level).
    * Models:
        * Rayleigh scattering (sky color).
        * Mie scattering (haziness, aerosol effects, cloud illumination).
        * Ozone absorption (optional, for Earth-like blue tint).
        * Multiple scattering approximation for realistic light transport.
    * Inputs: Sun direction, view direction, position within atmosphere, atmospheric density profile, scattering coefficients (from PlanetaryAtmosphericDynamics or PA).
3.  **Stellar Shaders:**
    * **Star Surface:** Procedurally generate stellar surfaces (photosphere) with features like granulation, convection cells, starspots. Implement limb darkening.
    * **Corona & Prominences:** Shaders for rendering the stellar corona (especially during eclipses or for active stars) and prominences. May use billboards or volumetric techniques.
    * **Flares:** Particle effects and emissive shaders for solar flares.
    * Inputs: Stellar temperature, radius, activity level, view angle.
4.  **Nebula Shaders (Volumetric):**
    * Implement volumetric rendering shaders using raymarching through 3D density fields (procedural noise or baked data).
    * Support different nebula types:
        * **Emission Nebulae:** Glowing gas illuminated by internal stars (HII regions).
        * **Reflection Nebulae:** Dust reflecting light from nearby stars.
        * **Dark Nebulae:** Opaque dust clouds obscuring background light.
    * Inputs: Density field, light sources within/near nebula, scattering/absorption properties of gas/dust.
5.  **Galaxy Shaders:**
    * For resolved/nearby galaxies:
        * Particle system shaders for rendering individual bright stars/star clusters.
        * Volumetric shaders for dust lanes and gas clouds.
    * For distant galaxies: Shaders for rendering galaxy impostors/billboards, potentially with some procedural texturing based on galaxy type/age.
6.  **Compact Object Shaders:**
    * **Black Hole Lensing Shader:** Implement gravitational lensing effect around black holes (and neutron stars).
        * Options: Screen-space ray tracing (more accurate, expensive) or mesh distortion of a "sky sphere" segment behind the black hole.
        * Inputs: Parameters from RelativisticPhenomenaModeler (RPM) (e.g., Schwarzschild radius, spin, Einstein radius).
    * **Accretion Disk Shader:**
        * Visualize accretion disks with varying temperature profiles (brighter/hotter inner regions).
        * Incorporate Doppler beaming (relativistic effect making approaching side brighter) and gravitational redshift.
        * Inputs: Disk geometry, temperature/emission profile from RPM.
    * **Relativistic Jet Shader:** Use particle systems and emissive/volumetric shaders to render jets, incorporating relativistic effects if possible (e.g., apparent superluminal motion if viewed at correct angle).
7.  **General Shader System Architecture:**
    * Support for shader permutations / uber-shaders to reduce shader count while allowing feature toggling.
    * Clear system for managing shader parameters and material instances.
    * Integration with the rendering pipeline for different passes (e.g., opaque, transparent, volumetric, post-processing).
    * Support for shader hot-reloading during development.

## 3. Technical Stack & Implementation Details

* **Shader Language:** GLSL (for Vulkan), HLSL (for DirectX 12), or a high-level shading language like WGSL if the engine supports it.
* **Performance Considerations:**
    * Shaders are critical for performance. Profile and optimize complex shaders (especially volumetric and relativistic effect shaders).
    * Use LOD for shader complexity where appropriate (e.g., simpler lighting models for distant objects).
    * Leverage GPU capabilities (e.g., texture arrays, compute shaders for pre-calculations).
* **Error Handling & Resilience:**
    * Graceful fallback if a specialized shader fails to compile or load (e.g., use a default PBR or unlit shader).
    * Validate shader inputs and material parameters.
* **Logging:**
    * Log shader compilation errors and warnings.
    * Log when specific complex shaders (e.g., lensing, nebula raymarcher) are activated for a view.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * SceneGraph_MultiScaleCoordinateSystem (SMCS): Provides mesh data, transformations, material assignments.
    * LevelOfDetail_Subsystem (LODS): Influences which shader variant or material complexity is used.
    * Lighting_ExposureEngine (LEE): Provides lighting information (sun direction, intensity, ambient light).
    * PlanetaryArchitect (PA) & PlanetaryAtmosphericDynamics (PAD): Provide atmospheric composition, density, surface material properties for planet/atmosphere shaders.
    * StellarEvolutionEngine (SEE): Provides stellar parameters (temperature, luminosity, radius) for star shaders.
    * RelativisticPhenomenaModeler (RPM): Provides parameters for lensing, accretion disk, and jet shaders.
    * CosmicObjectDatabase (COD): Indirectly, by providing the properties of objects that materials are assigned to.
* **Output (produces visuals for):**
    * The main rendering pipeline, contributing to the final rendered image.

## 5. Testing Strategy

* **Unit Tests (Shader Tests):**
    * Test individual shader features with specific inputs and verify output colors/effects against expected results (may require specialized shader testing frameworks or visual comparison tools).
    * Test PBR shader against reference PBR viewers/implementations.
    * Verify atmospheric scattering produces correct sky colors for different sun positions and atmospheric parameters.
* **Visual Validation (Critical):**
    * Render various test scenes showcasing each shader type:
        * A planet with atmosphere viewed from surface and orbit.
        * Different types of stars.
        * A nebula rendered volumetrically.
        * A black hole with accretion disk and lensing effects.
        * A galaxy at different distances.
    * Compare visual output against real astronomical images, scientific visualizations, or established CGI renditions for plausibility and appeal.
* **Performance Profiling:**
    * Profile GPU frame times when different complex shaders are active. Identify and optimize shader bottlenecks.
* **Cross-Platform/GPU Vendor Testing:**
    * Ensure shaders compile and run correctly without visual artifacts on target GPUs from different vendors (NVIDIA, AMD, Intel).

## 6. Documentation

* Document each major shader's purpose, inputs (uniforms, textures, vertex attributes), and expected visual output.
* Explain the scientific or artistic models behind complex shaders (e.g., scattering math, PBR equations, lensing approximation).
* Provide guidelines for artists/technical artists on how to create materials and textures compatible with the PBR workflow and specialized shaders.
* Document shader permutations and how to use them.
* List any external shader libraries or code snippets used.

## 7. Adherence to Project Principles

* **Scientific Grounding:** Shaders for natural phenomena (atmospheres, stars, nebulae, relativistic effects) should be based on physical principles.
* **Hierarchical & Scalable Universe:** Different shaders will be needed for objects viewed at vastly different scales and levels of detail.
* **Active Observation:** Shaders like atmospheric scattering and lensing directly model how light interacts and reaches the observer, shaping what they see.
* **Finite Computation:** Shader complexity must be managed; LODs for shaders and efficient algorithms are essential.
