# Prompt for Implementing: DynamicEncyclopedia_TutorialSystem (DETS)

**Project:** Project Odyssey
**Pillar:** V. The Oracle AI
**Module:** 4. DynamicEncyclopedia_TutorialSystem (DETS)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To provide an LLM-powered dynamic encyclopedia for on-demand content about astronomical objects and phenomena, and an interactive tutorial system to guide learning.
* **Functionality:**
    * **Encyclopedia:** Provides access to an LLM-powered dynamic encyclopedia covering astronomical objects, phenomena, physical laws, and relevant theories. Content can be generated on-demand by the LLM based on a topic query.
    * **Tutorials:** Generates interactive tutorials or guided explorations. For example, "Learn about stellar lifecycles" could guide the user to different types of stars in the simulation, with the LLM providing explanations at each step.
    * **Scenario Generation:** (Advanced) LLM could help generate simple narrative scenarios or points of interest descriptions based on procedural content.
    * **External Links:** The LLM can be prompted to provide links to reputable external scientific sources for users wishing to delve deeper.
* **First Principle Applied (Pillar V):** Learning should be integrated, contextual, and driven by curiosity. The LLM should leverage simulation data for relevance and accuracy.

## 2. Core Requirements & Functionality

You are to develop the DynamicEncyclopedia_TutorialSystem (DETS) module for Project Odyssey. This module leverages the Oracle AI to create rich, interactive learning experiences.

1.  **Dynamic Encyclopedia:**
    * Allow users to query topics related to astronomy, physics, and simulation content.
    * Interface with ContextualPromptConstructor (CPC) and LLM_Gateway_APIManager (LGAM) to generate encyclopedia entries on-demand.
    * Present encyclopedia content via the KnowledgePresenter (KP).
    * Include functionality to browse related topics or ask follow-up questions.
2.  **Interactive Tutorial System:**
    * Design a framework for creating and running interactive tutorials. Tutorials could involve:
        * Guiding the user to specific locations or objects in the simulation.
        * Presenting information or tasks at different stages.
        * Asking the user questions or prompting them to perform actions.
        * Using the LLM to provide explanations or feedback during the tutorial.
    * Develop a few initial tutorial scenarios (e.g., "Introduction to Star Types," "Exploring the Solar System").
3.  **Content Generation and Management:**
    * For tutorials, define a structure for tutorial steps, triggers, and LLM prompts.
    * For the encyclopedia, manage how topics are queried and how content is structured.
4.  **External Resource Linking:**
    * Implement a mechanism for the LLM (via CPC prompting) to suggest and display verified links to reputable external scientific resources (NASA, ESA, Wikipedia, ArXiv, etc.).
    * Potentially include a system for users to flag or suggest links.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Structures for defining tutorial flows, encyclopedia topic hierarchies (if any).
* **Scripting (Optional):** Consider a lightweight scripting language for defining tutorial logic if it becomes complex.
* **Content Storage:** Tutorial definitions and potentially curated encyclopedia links might be stored in configuration files or a simple database.

## 4. Integration Points

* **Interfaces With:**
    * ContextualPromptConstructor (CPC) and LLM_Gateway_APIManager (LGAM): For generating all textual content.
    * KnowledgePresenter (KP): For displaying encyclopedia entries and tutorial information.
    * Explorer's Interface (EI): To guide the user's navigation during tutorials (e.g., setting autopilot targets).
    * CosmicObjectDatabase (COD): To identify relevant objects for tutorials or encyclopedia entries.
* **Depends On:** ModularArchitecture_APILayer (MAAL).

## 5. Testing Strategy

* **Unit Tests:**
    * Test encyclopedia topic querying logic.
    * Test tutorial flow management (advancing steps, handling triggers).
* **Integration Tests:**
    * Test end-to-end encyclopedia query: User input -> DETS -> CPC -> LGAM (mocked) -> KP display.
    * Run through complete tutorial scenarios, verifying correct guidance, information display, and LLM interaction.
* **Content Review:**
    * Review generated encyclopedia content and tutorial scripts for accuracy, clarity, and educational value.
* **Usability Testing:**
    * Gather feedback on the ease of use and effectiveness of the encyclopedia and tutorial systems.

## 6. Documentation

* Guide for creating and modifying tutorial scenarios.
* Documentation on how the dynamic encyclopedia works and how to influence its content generation.
* List of available tutorials and encyclopedia features.

## 7. Adherence to Project Principles

* **Contextual & Interactive Learning:** This module is the primary driver for these principles.
* **Scientific Grounding:** Ensures information presented is accurate and educational content is sound.
* **User Engagement:** Aims to make learning about the universe an engaging and interactive experience.
* **Modularity:** Separates specific learning content (tutorials, encyclopedia) from the core LLM interaction and UI.
