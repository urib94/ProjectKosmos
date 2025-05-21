# PowerShell Script to Create Initial Project Odyssey Prompts

# Define Base Path (User should adjust this if necessary)
$BasePath = "C:\Users\urib9\projects\Odyssey\ProjectOdyssey_Prompts"

# --- 00_Project_Overview_And_Principles ---
$Pillar00Path = Join-Path -Path $BasePath -ChildPath "00_Project_Overview_And_Principles"
New-Item -ItemType Directory -Force -Path $Pillar00Path | Out-Null

# Prompt for 001_Project_Vision.txt
$Prompt001_Content = @"
**Context:** You are an LLM agent assisting in the design and conceptual development of "Project Odyssey," an ambitious immersive universe simulation. This is the foundational vision statement.

**Task:** Based on the project title "Project Odyssey: Immersive Universe Simulation," elaborate on the **Project Vision**.

**Instructions for Elaboration:**
1.  Define the overall **goal** of Project Odyssey in 1-2 sentences.
2.  Identify the **key features or experiences** the project aims to deliver to the user (e.g., exploration, scientific accuracy, education, interaction).
3.  Specify the intended **scope of exploration** (e.g., from planetary surfaces to intergalactic scales).
4.  Mention the role of **scientific accuracy** and **real-time interaction**.
5.  Briefly touch upon the **educational aspect** and the planned integration of an AI tutor.
6.  The tone should be inspiring and ambitious, yet grounded.

**Output Format:** A concise paragraph clearly outlining the Project Vision.
"@
$Prompt001_Path = Join-Path -Path $Pillar00Path -ChildPath "001_Project_Vision.md" # Changed to .md
Set-Content -Path $Prompt001_Path -Value $Prompt001_Content -Encoding UTF8
Write-Host "Created: $Prompt001_Path"

# Prompt for 002_Core_Philosophy.md
$Prompt002_Content = @"
**Context:** You are an LLM agent assisting in the design of "Project Odyssey." This prompt concerns the core philosophy underpinning the project's development. The project vision emphasizes scientific accuracy, real-time interaction, vast exploration, and an educational AI tutor.

**Task:** Define the **Core Philosophy** for Project Odyssey.

**Instructions for Definition:**
1.  State the overarching philosophical approach to designing and building the simulation.
2.  Emphasize the importance of designing from **"first principles."** Briefly explain what this means in the context of simulating a universe (i.e., building from fundamental truths of the universe and computational science, rather than just copying existing solutions without critical evaluation).
3.  List the key pillars that this philosophy will uphold (e.g., scalability, modularity, performance, scientific grounding, user engagement).
4.  The philosophy should guide all subsequent architectural and development decisions.

**Output Format:** A clear and concise statement of the Core Philosophy.
"@
$Prompt002_Path = Join-Path -Path $Pillar00Path -ChildPath "002_Core_Philosophy.md"
Set-Content -Path $Prompt002_Path -Value $Prompt002_Content -Encoding UTF8
Write-Host "Created: $Prompt002_Path"

# Prompt for 003_Guiding_Principles.md
$Prompt003_Content = @"
**Context:** You are an LLM agent assisting in the design of "Project Odyssey," an immersive universe simulation. The project's vision is to allow vast exploration with scientific accuracy and AI-guided learning. The core philosophy is to design from first principles, upholding scalability, modularity, performance, scientific grounding, and user engagement.

**Task:** List and briefly elaborate on the fundamental **Guiding Principles** derived from the Core Philosophy that will direct the architecture of Project Odyssey. There are seven such principles.

**Instructions for Elaboration (for each of the seven principles):**
* **Principle 1: Hierarchical & Scalable Universe:** Explain the need to manage extreme dynamic range in scale.
* **Principle 2: Gravity-Dominated Structure:** Mention the roles of Newtonian gravity and General Relativity (GR).
* **Principle 3: Finite Speed of Light:** Explain its impact on observation and as a universal limit.
* **Principle 4: Evolving Matter & Energy:** Describe the need for a dynamic simulation (stars evolve, universe expands).
* **Principle 5: Active Observation:** Explain how the user's perspective shapes their experience.
* **Principle 6: Finite Computation:** Emphasize the necessity of abstraction, Level of Detail (LOD), procedural generation, and targeted calculations.
* **Principle 7: Contextual & Interactive Learning:** Describe how information should be presented and how users should be able to interact for learning.

**Output Format:** A numbered list of the seven Guiding Principles, each with a brief (1-2 sentence) elaboration.
"@
$Prompt003_Path = Join-Path -Path $Pillar00Path -ChildPath "003_Guiding_Principles.md"
Set-Content -Path $Prompt003_Path -Value $Prompt003_Content -Encoding UTF8
Write-Host "Created: $Prompt003_Path"

# --- 01_Cosmic_Fabric_Engine ---
$Pillar01Path = Join-Path -Path $BasePath -ChildPath "01_Cosmic_Fabric_Engine"
New-Item -ItemType Directory -Force -Path $Pillar01Path | Out-Null

# Prompt for 01_00_Pillar_Overview.md
$Pillar01_Overview_Content = @"
**Context:** You are an LLM agent assisting in the design of "Project Odyssey." This prompt concerns the **Pillar I: The Cosmic Fabric Engine**. This pillar is responsible for the universe's representation and state.

**Architectural Blueprint Excerpt for Pillar I:**
* **Purpose:** To define, generate, store, and manage the state of the entire universe, its objects, and their properties over time.
* **First Principle Applied:** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.
* **Key Modules within this Pillar:**
    1.  `UniverseGenesisSeed (UGS)`
    2.  `CosmologicalModeler (CM)`
    3.  `GalacticForge (GF)`
    4.  `StellarNursery (SN)`
    5.  `PlanetaryArchitect (PA)`
    6.  `CatalogIntegrator (CI)`
    7.  `CosmicObjectDatabase (COD)`
    8.  `TemporalIndexer (TI)`

**Task:** Write a concise overview for the **Pillar I: The Cosmic Fabric Engine**.

**Instructions:**
1.  Reiterate the **Purpose** of this pillar.
2.  Briefly restate the **First Principle Applied** to this pillar.
3.  Conclude by stating that this pillar achieves its purpose through a series of interconnected modules (you don't need to list them again here, as they will be detailed individually).

**Output Format:** A short paragraph (3-5 sentences) summarizing the Cosmic Fabric Engine pillar.
"@
$Pillar01_Overview_Path = Join-Path -Path $Pillar01Path -ChildPath "01_00_Pillar_Overview.md"
Set-Content -Path $Pillar01_Overview_Path -Value $Pillar01_Overview_Content -Encoding UTF8
Write-Host "Created: $Pillar01_Overview_Path"

Write-Host "Initial project overview and Cosmic Fabric Engine pillar overview prompts created."
Write-Host "The prompt for '01_01_UniverseGenesisSeed_UGS' was provided by the user and is assumed to be in 'ProjectOdyssey_Prompts/01_Cosmic_Fabric_Engine/01_01_UniverseGenesisSeed_UGS/UGS_ModuleDesign_Prompt.md'."# PowerShell Script to Create CosmologicalModeler (CM) Module Design Prompt

# Define Base Path (User should adjust this if necessary)
$BasePath = "./ProjectOdyssey_Prompts"

# --- 01_Cosmic_Fabric_Engine ---
$Pillar01Path = Join-Path -Path $BasePath -ChildPath "01_Cosmic_Fabric_Engine"
$Module01_02_Path = Join-Path -Path $Pillar01Path -ChildPath "01_02_CosmologicalModeler_CM"
New-Item -ItemType Directory -Force -Path $Module01_02_Path | Out-Null

# Prompt for 01_02_CosmologicalModeler_CM/CM_ModuleDesign_Prompt.md
$CM_ModuleDesign_Prompt_Content = @"
# Prompt for Implementing: CosmologicalModeler (CM)

**Project:** Project Odyssey
**Pillar:** I. The Cosmic Fabric Engine
**Module:** 2. `CosmologicalModeler (CM)`

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Input:** `UniverseGenesisSeed (UGS)`, cosmological parameters (Ω\_matter, Ω\_lambda, H\_0, σ\_8, etc., potentially user-tunable within realistic bounds).
* **Process:** Generates the large-scale structure of the universe (cosmic web, voids, superclusters) using algorithms based on models like Lambda-CDM (L-CDM). This defines the initial density fields for subsequent galaxy formation.
* **Output:** Probability density maps or seed points for galaxy/galaxy cluster formation.
* **First Principle Applied (Pillar I):** The Universe is too vast to store explicitly. It must be generated and accessed dynamically based on observer context, combining known data with scientifically plausible procedural generation.

## 2. Core Requirements & Functionality

You are to develop the `CosmologicalModeler (CM)` module for Project Odyssey. This module is responsible for generating the initial large-scale structure (LSS) of the universe.

1.  **Cosmological Parameter Handling:**
    * Define a data structure to hold key cosmological parameters (e.g., Hubble constant H₀, matter density Ω\_m, dark energy density Ω\_Λ, radiation density Ω\_r, scalar spectral index n\_s, amplitude of scalar perturbations σ\_8).
    * Allow these parameters to be configurable at simulation startup (e.g., via configuration files, potentially with presets like "Planck 2018" or "WMAP").
    * Validate input parameters for physical plausibility.
2.  **Initial Conditions Generation:**
    * Based on the UGS and cosmological parameters, generate initial density fluctuations in the early universe. This could involve:
        * Generating a Gaussian random field with a power spectrum (e.g., Harrison-Zel'dovich or more complex, like a ΛCDM power spectrum P(k)).
        * Techniques like Fast Fourier Transforms (FFTs) on a grid might be employed.
3.  **LSS Evolution (Simplified or Approximated for Real-time Context):**
    * **Objective:** To produce a realistic-looking cosmic web (filaments, clusters, voids) that statistically matches observations and large-scale N-body simulations, without running a full N-body cosmological simulation in real-time.
    * **Approaches (select or combine, justify choice):**
        * **Zel'dovich Approximation (or extensions):** A computationally cheaper method to model the initial stages of structure formation by extrapolating particle trajectories.
        * **Adhesion Model:** Improves upon Zel'dovich by mimicking gravitational collapse and pancake formation.
        * **Displacement Field Methods:** Using pre-computed or analytically approximated displacement fields to move particles from a uniform grid to form structures.
        * **Procedural Noise-Based LSS:** Using advanced noise functions (e.g., multi-scale Worley noise, Perlin noise, or specialized LSS noise algorithms) to sculpt density fields that resemble a cosmic web. This is likely the most performant for real-time generation but requires careful tuning for scientific plausibility.
        * **Hybrid Approaches:** Combining elements of the above.
    * The output should be a 3D density field or a catalog of tracer particles/halo seeds representing the LSS.
4.  **Output Definition:**
    * The primary output should be data structures that the `GalacticForge (GF)` module can use to seed galaxy formation. This could be:
        * A 3D grid storing density values or gravitational potential.
        * A list of "halo" seed points with associated properties (mass, location, overdensity) identified from the evolved density field (e.g., using a Friends-of-Friends or Spherical Overdensity algorithm on tracer particles if that approach is taken).
        * Probability density maps indicating regions favorable for galaxy formation.
5.  **Scalability & Performance:**
    * The generation process must be scalable to cover vast cosmic volumes, potentially generated on-demand or in chunks as the player explores.
    * Consider methods for parallelization (multi-threading, GPU compute if applicable to the chosen algorithm).
    * LOD for LSS: While the LSS is very large scale, consider if different levels of detail or resolution are needed for its representation depending on viewing distance (though typically it's a backdrop for galactic scales).

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Libraries (Potential):**
    * FFTW or similar for Fourier transforms if generating Gaussian random fields.
    * Numerical libraries (e.g., Eigen, GSL) for matrix operations, interpolation.
    * Potentially a library for handling cosmological calculations if available and suitable (e.g., parts of CLASS or CAMB for power spectra, but be wary of integrating large external codes directly).
* **Data Structures:** Efficient 3D grids, particle lists, or octrees to store and query the generated density field or halo seeds.
* **Algorithm Choice Justification:** The selected algorithm(s) for LSS evolution must be justified based on a balance of scientific plausibility, visual realism of the resulting cosmic web, and computational performance for on-demand or large-scale generation.

## 4. Integration Points

* **Input:**
    * `UniverseGenesisSeed (UGS)`: To ensure deterministic generation.
    * Configuration System: For cosmological parameters.
* **Output (consumed by):**
    * `GalacticForge (GF)`: Provides the density fields, halo seeds, or probability maps necessary for GF to decide where and how to form galaxies.
    * `CosmicObjectDatabase (COD)`: May store a representation of the LSS if it's generated in discrete chunks or needs to be queried spatially.
    * `QuantumLeap Renderer (CBR - Cosmic Background Renderer)`: May use the LSS data to inform the rendering of very distant, unresolved galaxy distributions or intergalactic medium properties.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct parsing and handling of cosmological parameters.
    * Test individual components of the chosen LSS generation algorithm (e.g., power spectrum generation, displacement field calculation, noise function statistical properties).
    * Ensure deterministic output given the same UGS and parameters.
* **Statistical Validation:**
    * Compare statistical properties of the generated LSS (e.g., two-point correlation function, halo mass function if applicable) against theoretical predictions or results from established N-body cosmological simulations (e.g., Millennium, IllustrisTNG) to ensure scientific plausibility. This may require offline analysis tools.
* **Visual Inspection:**
    * Render slices or 3D visualizations of the generated density field/particle distribution to qualitatively assess if it forms a realistic-looking cosmic web.
* **Integration Tests:**
    * Verify that `GalacticForge (GF)` can correctly interpret and utilize the output of the CM module. For example, ensure galaxies tend to form in higher-density regions produced by CM.

## 6. Documentation

* Document the chosen cosmological model and parameters used.
* Detail the algorithm(s) implemented for LSS generation, including mathematical foundations and any simplifications made.
* Specify the format and structure of the output data provided to `GalacticForge`.
* Document any external libraries or data sources (e.g., for power spectra) used.
* Provide guidance on how to tune parameters for different cosmological scenarios or visual outcomes.

## 7. Adherence to Project Principles

* **Hierarchical & Scalable Universe:** The CM module lays the largest scale foundation upon which subsequent hierarchical structures (galaxies, stars, planets) are built.
* **Gravity-Dominated Structure:** The algorithms aim to reproduce the effects of gravity on dark matter and baryonic matter in shaping the cosmic web.
* **Finite Computation:** Employs approximations or procedural techniques to generate LSS without running full N-body simulations, balancing realism with performance.
* **Scientific Grounding:** The choice of cosmological parameters and LSS generation methods should be rooted in modern cosmology.
"@
$CM_ModuleDesign_Prompt_Path = Join-Path -Path $Module01_02_Path -ChildPath "CM_ModuleDesign_Prompt.md"
Set-Content -Path $CM_ModuleDesign_Prompt_Path -Value $CM_ModuleDesign_Prompt_Content -Encoding UTF8
Write-Host "Created: $CM_ModuleDesign_Prompt_Path"

Write-Host "CosmologicalModeler (CM) module design prompt created."