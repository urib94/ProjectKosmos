# Prompt for Implementing: Diagnostic_ProfilingSuite (DPS)

**Project:** Project Odyssey
**Pillar:** VI. The Continuum Core
**Module:** 5. Diagnostic_ProfilingSuite (DPS)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To provide in-built tools for real-time performance monitoring, logging, debugging, and profiling to identify bottlenecks and diagnose issues.
* **Real-time Monitoring:** In-built tools for displaying real-time performance metrics: CPU usage (per core, per thread, per system), GPU usage (engine load, memory bandwidth, shader performance), Memory allocation and usage (RAM and VRAM), Frame times (overall, and broken down by major systems like physics, rendering, AI), Asset streaming statistics, cache hit/miss rates.
* **Logging:** Comprehensive logging system with adjustable verbosity levels for different modules. Allows for easy diagnosis of issues.
* **Debugging Tools:** In-simulation debug views (e.g., wireframe rendering, display of physics bounding volumes, LOD levels, Octree structure, performance heatmaps).
* **Instrumentation:** Code instrumented for profiling to identify bottlenecks (e.g., using tools like Tracy, Optick, or engine-specific profilers).
* **First Principle Applied (Pillar VI):** Robustness, performance, and maintainability are paramount for a project of this complexity. Systems must be designed for efficiency and scalability from the outset.

## 2. Core Requirements & Functionality

You are to develop the Diagnostic_ProfilingSuite (DPS) module for Project Odyssey. This suite is essential for development, optimization, and troubleshooting.

1.  **Real-time Performance Metrics Display:**
    * Develop an overlay or dedicated UI panel to display key performance counters (CPU, GPU, memory, frame times, etc.) as listed in the architecture.
    * Allow customization of displayed metrics.
2.  **Logging System:**
    * Implement a flexible logging framework with multiple verbosity levels (e.g., Debug, Info, Warning, Error, Critical).
    * Support logging to console, file, and potentially an in-simulation console.
    * Allow filtering logs by module or severity.
    * Include timestamps, thread IDs, and source location in log messages.
3.  **In-Simulation Debug Views:**
    * Provide hooks and a system for modules to register custom debug rendering passes (e.g., wireframes, bounding boxes, physics visualization, LOD levels, spatial database structures).
    * Allow toggling these views at runtime.
4.  **Profiling Instrumentation:**
    * Integrate a lightweight profiling library (e.g., Tracy, Optick, or a simple custom solution) or provide macros/functions for instrumenting code blocks.
    * Capture timing data for functions and custom scopes across threads.
    * Provide tools for visualizing profiling data (either built-in or by exporting to external tools).
5.  **Crash Reporting (Optional but Recommended):**
    * Implement mechanisms to capture call stacks and relevant system information on crashes.
    * Allow users to optionally submit crash reports.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust (Adhere to overall project choice).
* **UI for Metrics/Debug:** Utilize the main UI engine or a dedicated library (e.g., Dear ImGui for debug interfaces).
* **Logging Libraries (Optional):** spdlog (C++), log (Rust), or a custom solution.
* **Profiling Libraries:** Tracy, Optick, Microprofile, or similar. Platform-specific tools can also be leveraged.
* **Performance Counters:** Utilize OS-level APIs (e.g., PDH on Windows, /proc on Linux) and graphics API queries for metrics.

## 4. Integration Points

* **Consumed By:** Developers and QA for performance analysis, debugging, and issue diagnosis.
* **Instruments:** All other modules for logging and profiling.
* **Integrates With:**
    * UserInterface_Engine (UIE): For displaying real-time stats and debug UIs.
    * QuantumLeap Renderer: For rendering debug views.
    * HighPerformanceComputingCore (HPCC): To profile jobs and parallel tasks.
* **Depends On:** ModularArchitecture_APILayer (MAAL) for APIs.

## 5. Testing Strategy

* **Unit Tests:**
    * Verify logging system (message formatting, filtering, output to different sinks).
    * Test basic profiling macros/functions (ensure they record data without crashing).
    * Test retrieval of performance counters (mock system APIs if needed).
* **Functional Tests:**
    * Ensure debug views can be toggled and display correct information.
    * Verify that the metrics overlay displays plausible data.
    * Test log filtering and verbosity controls.
* **Performance Tests (for the profiler itself):**
    * Measure the overhead of the profiling instrumentation to ensure it's acceptable for development builds.

## 6. Documentation

* Guide on how to use the logging system (macros, levels, filtering).
* Instructions for instrumenting code for profiling and using the profiling tools.
* Details on available debug views and how to enable them.
* List of exposed real-time performance metrics and their meanings.

## 7. Adherence to Project Principles

* **Performance:** Essential for identifying and fixing performance issues. The suite itself should have minimal impact on release builds.
* **Robustness:** Aids in diagnosing and fixing bugs, contributing to overall stability.
* **Maintainability:** Good diagnostic tools make the codebase easier to understand and maintain.
* **Developer Productivity:** A strong DPS significantly speeds up development and optimization efforts.

