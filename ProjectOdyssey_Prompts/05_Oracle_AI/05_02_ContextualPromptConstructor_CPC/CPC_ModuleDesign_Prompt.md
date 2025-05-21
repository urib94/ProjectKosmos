# Prompt for Implementing: ContextualPromptConstructor (CPC)

**Project:** Project Odyssey
**Pillar:** V. The Oracle AI
**Module:** 2. ContextualPromptConstructor (CPC)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To gather rich simulation context and user queries to construct detailed, optimized prompts for the LLM, including persona, context, query, output instructions, and conversational history.
* **Functionality (Crucial for effective LLM use):**
    * Gathers rich context from the simulation state when a user query is made: Observer Context, Object Context, Temporal Context, Interaction History.
    * Constructs detailed, optimized prompts for the LLM. This includes: System-level instructions (persona), user's query, gathered context, instructions on output format/detail, and requests for citations/links.
* **Example Prompt Snippet (from Arch):** "System: You are Kósmos, an AI assistant. User is currently orbiting planet 'Xylar' (a simulated terrestrial world, radius 6500km, mass 1.1 Earths, with a thin CO2 atmosphere, located in the 'Proxima Centauri' system). Current simulation date is 2350.2 CE. User asks: 'Could life exist on Xylar?' Provide a scientifically reasoned answer based on the provided planetary data, discussing habitability factors."
* **First Principle Applied (Pillar V):** Learning should be integrated, contextual, and driven by curiosity. The LLM should leverage simulation data for relevance and accuracy.

## 2. Core Requirements & Functionality

You are to develop the ContextualPromptConstructor (CPC) module for Project Odyssey. This module is vital for ensuring the LLM receives relevant and sufficient information to generate high-quality, context-aware responses.

1.  **Context Aggregation:**
    * Implement mechanisms to query various simulation modules for contextual data:
        * Explorer's Interface: Player location, target object, camera view.
        * CosmicObjectDatabase (COD): Properties of selected or relevant celestial objects.
        * TemporalIndexer (TI): Current simulation time 	_sim.
        * KnowledgePresenter (KP) or internal state: Recent conversation history for follow-up questions.
2.  **Prompt Engineering and Templating:**
    * Design and implement a flexible prompt templating system.
    * Allow for different prompt structures based on query type or desired output (e.g., factual recall, explanation, tutorial step).
    * Define a clear structure for prompts, including sections for system persona, simulation context, user query, and output formatting instructions.
3.  **Persona Management:**
    * Define and inject the "Kósmos" AI persona into prompts to guide the LLM's tone and style.
4.  **Output Control Instructions:**
    * Include instructions in the prompt to guide the LLM on the desired level of detail, technicality, and format of the response (e.g., "explain simply," "provide technical details," "list key factors").
5.  **Conversational Context Management:**
    * Store and retrieve recent turns of conversation to enable coherent follow-up questions and maintain context.
    * Decide how much history to include in subsequent prompts to balance context richness with prompt length limits.
6.  **Dynamic Information Injection:**
    * Efficiently gather and format simulation data (e.g., planetary parameters, stellar characteristics) for inclusion in the prompt.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Data Structures:** Structures for holding aggregated context, prompt templates, conversation history.
* **String Manipulation:** Efficient string formatting and manipulation libraries.
* **Templating Engines (Optional):** Consider simple templating libraries if prompt structures become very complex.
* **Configuration:** Prompt templates, persona definitions, and context-gathering rules should be configurable.

## 4. Integration Points

* **Receives Input From:**
    * UserInterface_Engine (UIE) or KnowledgePresenter (KP): User queries and interaction events.
* **Queries Data From:**
    * Explorer's Interface (UCVC, OITS): Observer and target context.
    * CosmicObjectDatabase (COD): Detailed object data.
    * TemporalIndexer (TI): Simulation time.
* **Outputs Prompts To:** LLM_Gateway_APIManager (LGAM).
* **Depends On:** ModularArchitecture_APILayer (MAAL) for interfacing with other modules.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify correct aggregation of context from mocked simulation modules.
    * Test prompt generation logic with various inputs and templates.
    * Ensure correct inclusion of persona, user query, and output instructions.
    * Test conversational history management.
* **Integration Tests:**
    * Test the full pipeline: User query -> CPC context gathering -> CPC prompt generation -> LGAM (mocked) submission.
    * Validate that prompts sent to a mock LGAM contain accurate and relevant contextual information.
* **Qualitative Prompt Review:**
    * Manually review generated prompts for clarity, completeness, and effectiveness in guiding LLM responses.

## 6. Documentation

* Detailed documentation of the context aggregation process and data sources.
* Explanation of the prompt templating system and how to create/modify templates.
* Guidelines for prompt engineering best practices within Project Odyssey.
* Description of how conversational context is managed.

## 7. Adherence to Project Principles

* **Contextual Learning:** Core function of this module is to provide rich context for learning.
* **Scientific Integrity:** Ensures that relevant scientific data from the simulation is passed to the LLM.
* **User Engagement:** Well-crafted prompts lead to more relevant and engaging LLM responses.
* **Modularity:** Decouples prompt logic from direct LLM API interaction and UI presentation.
