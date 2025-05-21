# ANELM AGENT INSTRUCTION & MEMORY FILE

## Quickstart for Agents
**IMPORTANT:** Before starting work on any module or prompt, you must **read the Technology Stack prompt** (usually found as `TechnologyStack_Prompt.md` or similarly named in the project). This ensures you use the correct languages, libraries, and tools as intended for Project Odyssey. Always review the technology stack prompt before reading and implementing any module prompt.

1. **Read this file fully.**
2. **Read `ProjectArchitecture.md`** for the overall project blueprint.
3. **Find your assigned module or task:**
   - Locate the relevant prompt file (named `ModuleDesign_Prompt.md` or similar) in the appropriate subdirectory under `ProjectOdyssey_Prompts/`.
   - Read the prompt file for detailed requirements and API.
4. **Implement the module** as specified, following both the architecture and the prompt.
5. **Write code, documentation, and tests** as required.
6. **After each step, log your progress in this file** (see "Log Format" below).
7. **If you finish a module, mark it as COMPLETED and specify the next step.**
8. **If you encounter blockers, log them here and suggest how to proceed.**

---

## How to Implement Prompts

- Read the requirements and API in the prompt file.
- Design the module to fit the overall architecture.
- Write code, documentation, and tests as specified in the prompt.
- Ensure your implementation integrates with other modules as described in the architecture.
- Follow best practices for code quality and documentation.

---

## How to Call/Invoke the Agent

- **To start work, simply instruct the agent:**
  > "Read `ProjectOdyssey_Prompts/INSTRUCTIONS_FOR_ANELM_AGENT.md` and follow its workflow."
- The agent will then:
  1. Read this file for instructions and logging.
  2. Read `ProjectArchitecture.md` for context.
  3. Read the relevant prompt file for the assigned module.
  4. Begin implementation and log progress here.

---

## Purpose
This file is the central instruction set, memory, and progress log for Anelm LLM agents working on Project Odyssey. It enables any agent to:
- Understand the project structure and workflow.
- Know how to utilize the project architecture and prompt files.
- Track what has been completed and what remains.
- Seamlessly continue work across sessions and conversations.

---

## 1. Getting Started: Agent Workflow

1. **Read This File First:**
   - This file contains the latest project status, instructions, and log of completed tasks.
   - It is your primary source of context and memory for the project.

2. **Read the Project Architecture:**
   - File: `ProjectArchitecture.md`
   - This file contains the comprehensive blueprint and design principles for the entire project. It defines all modules, their relationships, and the overall vision.

3. **Locate the Relevant Prompt:**
   - Each module or feature to be implemented has a corresponding prompt file (e.g., `ModuleDesign_Prompt.md` or `prompt.md`) in the appropriate subdirectory.
   - The prompt file provides detailed requirements, API, and testing strategy for that module.

4. **Implementation Steps:**
   - For the current task, read the relevant prompt and the architecture section for that module.
   - Implement the module according to:
     - The requirements in the prompt.
     - The overall design and principles in the architecture.
   - Ensure code, documentation, and tests are created as specified.

5. **Update This File After Each Step:**
   - At the end of each message or implementation step, update this file with:
     - What was completed (module, file, or feature).
     - Any important decisions, deviations, or notes.
     - What remains to be done (next steps, blockers, or TODOs).
   - Use the log format below.

6. **For New Sessions/Agents:**
   - Read this file and the architecture to understand the current state.
   - Continue from the last unfinished or next step as indicated in the log.

---

## 2. Log Format (Progress & Memory)

### Example Entry
```
[YYYY-MM-DD HH:MM] [AgentName or LLM] [ACTION] [MODULE/PATH]
- Summary of what was done.
- Notes/decisions.
- Next steps or TODOs.
```

### Example
```
[2024-06-12 15:00] [Anelm-GPT4] [COMPLETED] ProjectOdyssey_Prompts/01_Cosmic_Fabric_Engine/01_01_UniverseGenesisSeed_UGS
- Implemented UniverseGenesisSeed (UGS) C++ module: header, implementation, and unit tests as per prompt and architecture.
- Supports 64/128-bit master seed, thread-safe API, deterministic hierarchical seed derivation, export/import, and edge case handling.
- Next: Begin CosmologicalModeler_CM module.
```

---

## 3. Guidelines for Agents

- **Always consult both the architecture and the relevant prompt before starting work.**
- **Document all progress and decisions in this file.**
- **If you finish a module, mark it as COMPLETED and specify the next logical step.**
- **If you encounter blockers or need clarification, log the issue and suggest how to proceed.**
- **Keep entries concise but informative.**
- **Do not delete previous log entries.**
- **If you make changes to the workflow or this file, document the reason.**

---

## 4. Project Structure Reference
- Prompts are located in: `ProjectOdyssey_Prompts/` (see subfolders for each engine/module)
- Architecture: `ProjectArchitecture.md`
- This file: `ProjectOdyssey_Prompts/INSTRUCTIONS_FOR_ANELM_AGENT.md`

---

## 5. Current Progress Log

[START LOG BELOW] 

---

## Development Map (Pillars & Modules)

- **01_Cosmic_Fabric_Engine**
  - 01_01_UniverseGenesisSeed_UGS
  - 01_02_CosmologicalModeler_CM
  - 01_03_GalacticForge_GF
  - 01_04_StellarNursery_SN
  - 01_05_PlanetaryArchitect_PA
  - 01_06_CatalogIntegrator_CI
  - 01_07_CosmicObjectDatabase_COD
  - 01_08_TemporalIndexer_TI
- **02_AstroDynamics_Engine**
  - 02_01_NBodyGravitationalOrchestrator_NGO
- **03_QuantumLeap_Renderer**
- **04_Explorers_Interface**
- **05_Oracle_AI**
- **06_Continuum_Core**
- **07_Technology_Stack**
- **08_Development_Phasing**
- **09_Astrophysicists_Sanity_Checks**

---

## Priority Prompt List (Implementation Checklist)

> **Instructions for Agents:**
> 1. Read this checklist and find the first prompt file that is not marked as `[DONE]`.
> 2. Implement the module as specified in the prompt and according to the workflow above.
> 3. When finished, mark the prompt as `[DONE]` in this list and log your work below.
> 4. The next agent will continue with the next unchecked prompt.

- [ ] 01_Cosmic_Fabric_Engine/01_01_UniverseGenesisSeed_UGS/prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_02_CosmologicalModeler_CM/CM_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_03_GalacticForge_GF/GF_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_04_StellarNursery_SN/SN_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_05_PlanetaryArchitect_PA/PA_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_06_CatalogIntegrator_CI/CI_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_07_CosmicObjectDatabase_COD/COD_ModuleDesign_Prompt.md
- [ ] 01_Cosmic_Fabric_Engine/01_08_TemporalIndexer_TI/TI_ModuleDesign_Prompt.md
- [ ] 02_AstroDynamics_Engine/02_01_NBodyGravitationalOrchestrator_NGO/NGO_ModuleDesign_Prompt.md
- [ ] 03_QuantumLeap_Renderer/QLR_ModuleDesign_Prompt.md
- [ ] 04_Explorers_Interface/EI_ModuleDesign_Prompt.md
- [ ] 05_Oracle_AI/OAI_ModuleDesign_Prompt.md
- [ ] 06_Continuum_Core/CC_ModuleDesign_Prompt.md
- [ ] 07_Technology_Stack/TechStack_ModuleDesign_Prompt.md
- [ ] 08_Development_Phasing/DevelopmentPhasing_ModuleDesign_Prompt.md
- [ ] 09_Astrophysicists_Sanity_Checks/SanityChecks_ModuleDesign_Prompt.md

--- 