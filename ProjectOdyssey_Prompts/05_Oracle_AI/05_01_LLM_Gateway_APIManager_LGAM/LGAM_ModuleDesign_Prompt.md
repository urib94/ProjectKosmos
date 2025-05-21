# Prompt for Implementing: LLM_Gateway_APIManager (LGAM)

**Project:** Project Odyssey
**Pillar:** V. The Oracle AI
**Module:** 1. LLM_Gateway_APIManager (LGAM)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To securely interface with external LLM APIs, manage API keys, handle request/response formatting, errors, rate limiting, and abstract provider details for flexibility.
* **Functionality:**
    * Securely interfaces with chosen external LLM APIs (e.g., Google Gemini API, OpenAI GPT series, Anthropic Claude API).
    * Manages API keys, authentication tokens, and request/response formatting according to specific LLM provider requirements.
    * Handles network communication, error handling (retries, timeouts), and rate limiting to stay within API usage quotas.
    * Abstracts specific LLM provider details, allowing for potential switching or use of multiple LLMs.
* **First Principle Applied (Pillar V):** Learning should be integrated, contextual, and driven by curiosity. The LLM should leverage simulation data for relevance and accuracy.

## 2. Core Requirements & Functionality

You are to develop the LLM_Gateway_APIManager (LGAM) module for Project Odyssey. This module serves as the crucial link between the simulation and external Large Language Models.

1.  **API Client Implementation:**
    * Develop robust clients for selected LLM providers (e.g., Gemini, OpenAI, Anthropic).
    * Implement HTTP request/response handling, including setting appropriate headers and parsing JSON responses.
2.  **Secure Key Management:**
    * Design a secure method for storing and accessing API keys (e.g., environment variables, encrypted configuration files, or a dedicated secrets manager if available). Avoid hardcoding keys.
3.  **Request/Response Handling:**
    * Implement logic for constructing API requests according to each provider's specification.
    * Parse LLM responses, extracting relevant content and metadata.
    * Handle various HTTP status codes and API-specific error codes gracefully.
4.  **Error Handling and Retries:**
    * Implement retry mechanisms for transient network errors or rate limit issues, with exponential backoff.
    * Log errors comprehensively for debugging.
5.  **Rate Limiting:**
    * Implement mechanisms to respect API rate limits imposed by LLM providers to prevent service disruption.
6.  **Provider Abstraction:**
    * Design an internal interface that abstracts the specifics of different LLM providers. This allows ContextualPromptConstructor (CPC) to interact with LGAM in a provider-agnostic way.
    * Allow for configuration-based selection of the active LLM provider.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **Networking Libraries:** Utilize robust HTTP client libraries (e.g., libcurl, cpprestsdk for C++; reqwest, hyper for Rust).
* **JSON Parsing Libraries:** Libraries for parsing JSON responses (e.g., RapidJSON, nlohmann/json for C++; serde_json for Rust).
* **Security:** Implement best practices for handling sensitive API keys.
* **Configuration:** API endpoints, keys, and provider choices should be configurable.

## 4. Integration Points

* **Consumed By:** ContextualPromptConstructor (CPC): Submits constructed prompts to the LGAM for forwarding to the selected LLM.
* **Depends On:**
    * Configuration_ScalabilityManager (CSM): For API keys, provider selection, and endpoint configurations.
    * Diagnostic_ProfilingSuite (DPS): For logging API requests, responses, and errors.
* **External Dependencies:** Chosen LLM provider APIs.

## 5. Testing Strategy

* **Unit Tests:**
    * Test API client functionality for each supported provider (mocking HTTP responses).
    * Verify secure loading of API keys.
    * Test request construction and response parsing logic.
    * Test error handling and retry mechanisms.
    * Test provider abstraction layer.
* **Integration Tests (Requires API Access or Mock Server):**
    * Send actual requests to LLM provider staging/test endpoints (if available) or a mock LLM server.
    * Verify end-to-end request/response flow.
    * Test rate limiting behavior.
* **Security Audits (Recommended):**
    * Review API key management and handling for potential vulnerabilities.

## 6. Documentation

* Detailed documentation of the supported LLM providers and their specific configuration requirements.
* API documentation for how other modules (primarily CPC) should interact with LGAM.
* Guidelines for adding support for new LLM providers.
* Security considerations for API key management.

## 7. Adherence to Project Principles

* **Modularity:** Clearly separates LLM interaction logic from prompt construction and presentation.
* **Robustness:** Handles network issues, API errors, and rate limits gracefully.
* **Scalability/Flexibility:** Allows for easy switching or addition of LLM providers.
* **Security:** Emphasizes secure handling of sensitive API credentials.
