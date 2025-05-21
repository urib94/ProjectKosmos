# Prompt for Implementing: KnowledgePresenter (KP)

**Project:** Project Odyssey
**Pillar:** V. The Oracle AI
**Module:** 3. KnowledgePresenter (KP)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To display LLM responses in an integrated, non-intrusive UI panel, format text for readability, support markdown, images (if applicable), follow-up queries, and maintain conversational context.
* **Functionality:**
    * Displays LLM responses in an integrated, non-intrusive UI panel (e.g., a pop-up window, a dedicated screen in a virtual cockpit).
    * Formats text for readability (markdown support, code blocks for data if applicable).
    * Handles rendering of images or diagrams if the LLM supports generating them or if it provides links to them.
    * Allows for easy copying of information.
    * Facilitates follow-up questions, maintaining conversational context via the CPC.
* **First Principle Applied (Pillar V):** Learning should be integrated, contextual, and driven by curiosity. The LLM should leverage simulation data for relevance and accuracy.

## 2. Core Requirements & Functionality

You are to develop the KnowledgePresenter (KP) module for Project Odyssey. This module is responsible for the user-facing presentation of information from the Oracle AI.

1.  **UI Integration:**
    * Design and implement a UI panel or window for displaying LLM responses. This should be integrated seamlessly with the main UserInterface_Engine (UIE).
    * Ensure the panel is non-intrusive and can be easily shown/hidden by the user.
2.  **Response Formatting:**
    * Parse and render LLM responses, supporting markdown for text formatting (bold, italics, lists, code blocks, links).
    * Handle line breaks and paragraph formatting for readability.
3.  **Rich Content Display (Optional):**
    * If LLMs provide image URLs or can generate simple diagrams (e.g., via textual DSLs that can be rendered), implement support for displaying these.
4.  **Interaction Features:**
    * Allow users to copy text from the response.
    * Provide an input field for follow-up questions.
    * Implement scrolling for long responses.
5.  **Conversational History Display:**
    * Display the current conversation (user queries and LLM responses) in a chat-like interface.
    * Manage the display of this history, potentially with options to clear or export it.
6.  **State Management:**
    * Maintain the state of the Oracle AI interface (e.g., visibility, current conversation).

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **UI Toolkit:** Utilize the project's main UserInterface_Engine (UIE) or a compatible UI library.
* **Markdown Parsing:** Integrate a lightweight markdown parsing library.
* **Text Rendering:** Leverage the UI engine's text rendering capabilities.
* **Image Loading/Display (Optional):** If supporting images, use the UI engine's image components or an image loading library.

## 4. Integration Points

* **Receives LLM Responses From:** LLM_Gateway_APIManager (LGAM) (indirectly, likely after processing by CPC or a controller).
* **Sends User Queries To:** ContextualPromptConstructor (CPC) for new or follow-up questions.
* **Integrates With:** UserInterface_Engine (UIE) for rendering all UI elements.
* **Depends On:** ModularArchitecture_APILayer (MAAL) for API definitions.

## 5. Testing Strategy

* **Unit Tests:**
    * Test markdown parsing and formatting logic.
    * Verify correct display of conversational history.
* **UI Tests (Manual or Automated):**
    * Ensure the Oracle AI panel displays correctly, is responsive, and user interactions (scrolling, copying, inputting queries) work as expected.
    * Test rendering of various markdown features.
    * Verify that LLM responses are displayed accurately and readably.
* **Usability Testing:**
    * Gather feedback on the clarity, ease of use, and non-intrusiveness of the Oracle AI interface.

## 6. Documentation

* Design specifications for the Oracle AI UI panel.
* Details on supported markdown features.
* How to integrate new UI elements or custom formatting if needed.

## 7. Adherence to Project Principles

* **User Engagement:** A clear, readable, and interactive presentation layer enhances user engagement with the AI.
* **Contextual Learning:** Facilitates an ongoing dialogue, allowing users to delve deeper into topics.
* **Modularity:** Separates presentation logic from AI backend and core UI rendering.
* **Accessibility:** Strive for a design that is easy to read and interact with.
