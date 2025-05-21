# Prompt for Implementing: Astrophysicists' Sanity Checks

**Project:** Project Odyssey
**Pillar:** IX. Astrophysicists' Sanity Checks

## 1. Pillar Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Purpose:** To ensure scientific rigor, validation, and best practices are embedded throughout the project, maintaining the highest standards of astrophysical plausibility and educational value.
* **First Principle Applied:** Every abstraction or simplification must be a conscious, documented decision, balancing scientific fidelity with computational feasibility and user experience.

## 2. Scientific Validation & Implementation Vision

You are to implement the Astrophysicists' Sanity Checks for Project Odyssey. This pillar is responsible for:
- Defining and enforcing scientific validation criteria
- Handling edge cases and singularities
- Ensuring data integrity and educational accuracy

Address the following areas:

### 2.1 Scale & Precision
* Relentlessly test and validate floating-point precision across all scales, from planetary meters to intergalactic megaparsecs.
* Use double precision for core physics and positions; manage GPU limitations for rendering.
* Document and test all scale transitions and coordinate systems.

### 2.2 Time Handling
* Ensure consistent and accurate handling of simulation time (`t_sim`), light travel time, and relativistic effects.
* Clarify and document what "current time" means in different contexts.
* Test time acceleration, dilation, and reversal features for correctness.

### 2.3 Scientific Accuracy vs. Performance/Gameplay
* Document all abstractions and simplifications, with rationale for each.
* Balance scientific fidelity with computational feasibility and user experience.
* Provide clear guidance on what is simulated, what is approximated, and what is omitted.

### 2.4 Edge Cases & Singularities
* Define and test behavior for extreme scenarios (event horizons, edge of universe, singularities).
* Implement softening, computational boundaries, or special-case logic as needed.
* Document all edge case handling strategies.

### 2.5 Data Validation & Vetting
* Ensure all real astronomical data is correctly interpreted and validated for plausibility.
* Base procedural generation algorithms on current, peer-reviewed astrophysical theories and observations.
* Provide tools for cross-checking simulation outputs against known data and theory.

### 2.6 Educational Integrity
* Fact-check all information provided through the Oracle AI and UI.
* Clearly distinguish between simulation artifacts and real-world certainties.
* Provide citations and references for all scientific claims and educational content.

## 3. Technical Stack & Implementation Details

* **Validation Tools:** Develop automated and manual tools for scientific validation, precision testing, and data vetting.
* **Documentation:** Maintain a living record of all scientific decisions, edge case handling, and validation results.
* **Testing:** Integrate scientific validation into unit, integration, and system-level tests.

## 4. Integration Points

* **Input:**
    * Simulation outputs, real data, and user feedback.
* **Output:**
    * Validation reports, documentation, and flagged issues for review.
    * Feedback to all pillars for continuous improvement.

## 5. Testing Strategy

* **Precision Tests:**
    * Test floating-point accuracy and scale transitions.
* **Scientific Validation:**
    * Compare simulation outputs to known data and theory.
* **Edge Case Tests:**
    * Simulate and document behavior in extreme scenarios.
* **Educational Review:**
    * Fact-check all user-facing content and provide references.

## 6. Documentation

* Document all validation criteria, test results, and scientific decisions.
* Provide guidance for future contributors on maintaining scientific rigor.
* Maintain a changelog of all scientific updates and corrections.

## 7. Adherence to Project Principles

* **Scientific Grounding:** All systems and content are rooted in current astrophysical understanding.
* **Transparency:** All simplifications and edge cases are documented and justified.
* **Educational Value:** Ensure the simulation is a trustworthy, accurate learning tool. 