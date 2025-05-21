# Prompt for Implementing: Technology Stack

**Project:** Project Odyssey
**Pillar:** VII. Technology Stack

## 1. Pillar Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To define and guide the selection and integration of all core technologies, libraries, and tools that underpin the project's architecture and implementation.
* **First Principle Applied:** Technology choices must support scalability, performance, scientific accuracy, and maintainability.

## 2. Core Technology Choices & Implementation Vision

You are to define and implement the Technology Stack for Project Odyssey. This pillar is responsible for all foundational technology decisions and their integration. Address the following areas:

### 2.1 Primary Development Language
* Choose between C++ and Rust based on project needs (performance, safety, ecosystem).
* Justify the choice and ensure consistent use across all modules.

### 2.2 Graphics API
* Prefer Vulkan for cross-platform, high-performance rendering.
* Consider DirectX 12 (Windows) as an alternative if needed.
* Ensure support for HDR, advanced shaders, and multi-scale rendering.

### 2.3 Game/Simulation Engine
* Evaluate custom engine, Godot (C++/GDExtension), or Bevy (Rust) for suitability.
* Justify the engine choice based on flexibility, performance, and required features.
* Plan for necessary engine modifications (multi-scale, double precision, advanced physics).

### 2.4 Physics Libraries
* Integrate or draw inspiration from N-body and cosmology codes (REBOUND, ChaNGa, Gadget, AREPO, Enzo).
* Use or adapt open-source libraries for specific needs (e.g., FFTW, Eigen, GSL).

### 2.5 LLM APIs
* Integrate with OpenAI, Gemini, Claude, or Hugging Face APIs for AI features.
* Support secure key management and flexible provider selection.

### 2.6 Data Storage & Serialization
* Use SQLite for local data, efficient binary formats (Arrow, Protobuf, FlatBuffers, HDF5) for large datasets.
* Plan for catalog integration, save states, and asset management.

### 2.7 Version Control & IDE
* Use Git (with LFS for large assets) for source control.
* Recommend Visual Studio, CLion, or VS Code for development.

## 3. Technical Stack & Implementation Details

* **Language:** C++ or Rust, with rationale and project-wide consistency.
* **Graphics:** Vulkan (preferred), with support for advanced rendering features.
* **Engine:** Custom, Godot, or Bevy, with required modifications.
* **Physics:** Integrate or adapt open-source libraries as needed.
* **AI:** RESTful API integration, secure key storage, and provider abstraction.
* **Data:** Use efficient, scalable storage and serialization formats.
* **Version Control:** Git, with clear branching and release strategies.
* **IDE:** Recommend and configure for team productivity.

## 4. Integration Points

* **Input:**
    * Requirements from all pillars and modules.
* **Output:**
    * Technology stack documentation, build scripts, and integration guides.
    * Support for all development, simulation, and deployment workflows.

## 5. Testing Strategy

* **Unit Tests:**
    * Test integration of core libraries, APIs, and data formats.
* **Performance Tests:**
    * Benchmark rendering, physics, and data storage solutions.
* **Integration Tests:**
    * Ensure compatibility across all modules and platforms.

## 6. Documentation

* Document all technology choices, integration steps, and rationale.
* Provide setup guides, build instructions, and troubleshooting tips.
* Maintain up-to-date stack documentation as the project evolves.

## 7. Adherence to Project Principles

* **Performance & Scalability:** All technology choices must support the project's scientific and interactive ambitions.
* **Maintainability:** Favor open, well-supported, and extensible technologies.
* **Modularity:** Ensure all stack components can be updated or replaced as needed. 