# Prompt for Implementing: Oracle AI (OAI)

**Project:** Project Odyssey
**Pillar:** V. The Oracle AI

## 1. Pillar Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To integrate advanced AI (Large Language Models - LLMs) to provide contextual information, answer questions, and guide learning, acting as an expert companion.
* **First Principle Applied:** Learning should be integrated, contextual, and driven by curiosity. The LLM should leverage simulation data for relevance and accuracy.

## 2. Core Modules & Implementation Vision

You are to develop the Oracle AI (OAI) pillar for Project Odyssey. This pillar is responsible for all AI-driven knowledge, Q&A, and learning systems. Implement the following modules:

### 2.1 LLM_Gateway_APIManager (LGAM)
* Securely interface with external LLM APIs (e.g., OpenAI, Gemini, Claude).
* Manage API keys, authentication, request/response formatting, error handling, and rate limiting.
* Abstract provider details for flexibility.

### 2.2 ContextualPromptConstructor (CPC)
* Gather rich simulation context (observer, object, temporal, interaction history).
* Construct detailed, optimized prompts for the LLM, including persona, user query, context, and output instructions.
* Support prompt customization for different output styles and detail levels.

### 2.3 KnowledgePresenter (KP)
* Display LLM responses in an integrated, non-intrusive UI panel.
* Format text for readability, support markdown, images, and follow-up queries.
* Maintain conversational context.

### 2.4 DynamicEncyclopedia_TutorialSystem (DETS)
* Provide LLM-powered dynamic encyclopedia and interactive tutorials.
* Generate on-demand content, scenario guides, and external resource links.
* Support user-driven exploration and learning.

### 2.5 QueryLogger_FeedbackLoop (QLFL)
* Log anonymized user queries and LLM responses (with consent).
* Analyze data for common questions, prompt effectiveness, and response quality.
* Support future LLM fine-tuning and improvement.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **API Integration:** Support for RESTful API calls, secure key storage, and error handling.
* **Data Structures:** Prompt templates, context objects, conversation logs.
* **Performance:** Optimize for low-latency LLM interactions and UI updates.
* **Configuration:** Allow for API provider selection, prompt templates, and privacy settings.

## 4. Integration Points

* **Input:**
    * User queries, simulation state, and object data.
* **Output:**
    * LLM responses, encyclopedia entries, and tutorial content to the UI.
    * Feedback to simulation modules for context-aware assistance.

## 5. Testing Strategy

* **Unit Tests:**
    * Test API integration, prompt construction, and response formatting.
* **Usability Tests:**
    * Assess clarity, helpfulness, and scientific accuracy of LLM responses.
* **Integration Tests:**
    * Ensure compatibility with UI and simulation modules.

## 6. Documentation

* Document all AI modules, API integration, and prompt engineering strategies.
* Specify the format and structure of prompts, responses, and logs.
* Provide guidance for extending AI capabilities and ensuring privacy.

## 7. Adherence to Project Principles

* **Contextual Learning:** AI responses are grounded in simulation context and user curiosity.
* **Scientific Integrity:** Ensure information is accurate, cited, and clearly distinguished from simulation artifacts.
* **Performance:** Optimize for real-time, interactive learning.
* **Modularity:** Provide a clean, well-documented API for integration with other modules. 