# Prompt for Implementing: AudioEngine (AE)

**Project:** Project Odyssey
**Pillar:** III. The QuantumLeap Renderer (or potentially a core utility service - TBD)
**Module:** 7. AudioEngine (AE)

## 1. Module Overview

**As per the Project Odyssey Architectural Blueprint:**

* **Function:** Provides an immersive auditory experience.
* **Content:**
    * **Procedural & Sampled Audio:** Mixture of pre-recorded sounds and procedurally generated audio.
    * **Physics-Driven Sounds (Player Feedback):** Engine thrust, impacts – for player feedback via their "ship" or suit, acknowledging sound doesn't travel in vacuum.
    * **Ambient Soundscapes:** "Ship" hum, UI sounds.
    * **Data Sonification:** Radio emissions from Jupiter, pulsars - presented as if processed by instruments.
* **Note on Placement:** While listed under Pillar III in the initial detailed architecture, the AudioEngine's role as a provider of auditory experience might make it suitable as a standalone utility system or part of Pillar VI (Continuum Core). This prompt will proceed with it under Pillar III for now, but the final architectural placement can be revisited. The core functionality remains the same.

## 2. Core Requirements & Functionality

You are to develop the AudioEngine (AE) module for Project Odyssey. This module is responsible for managing and rendering all audio aspects of the simulation, enhancing immersion and providing crucial feedback to the player.

1.  **Sound Asset Management:**
    * Load, store, and manage various audio assets (e.g., WAV, OGG, MP3 files).
    * Support for different sound types: one-shot effects, looping ambiances, music tracks.
2.  **3D Positional Audio:**
    * Implement a robust 3D audio system that positions sounds in space relative to the listener (player camera/avatar).
    * Support for standard audio effects related to position:
        * Attenuation based on distance.
        * Panning (left/right/surround channels).
        * Doppler effect for moving sound emitters relative to the listener.
3.  **Sound Emitter Component:**
    * Define a component or system that can be attached to game objects (ships, stations, planetary features) to emit sounds.
    * Emitters should have properties like sound to play, volume, looping, range, 3D position.
4.  **Physics-Driven & Event-Triggered Sounds (Player Feedback Focus):**
    * **Ship Systems:** Engine thrust (varying with throttle), RCS thrusters, jump drive activation/deactivation, shield impacts, hull stress, docking clamps.
    * **Player Actions:** Footsteps (on surfaces), suit thrusters (EVA), tool usage.
    * **Impacts/Collisions:** Sounds for ship collisions or landing, scaled by impact force.
    * **Alarms & Alerts:** Critical warnings (e.g., low oxygen, hull breach, missile lock).
    * *Acknowledgement of Vacuum:* For external ship sounds, the premise is that these are heard by the player via internal ship sensors/systems or through hull vibrations, not through direct sound propagation in space.
5.  **Ambient Soundscapes & Music:**
    * **Interior Ambiance:** Background hum for ship interiors, space stations.
    * **UI Sounds:** Feedback for menu navigation, button clicks, information pop-ups.
    * **Music System:**
        * Play background music tracks.
        * Support for dynamic music that changes based on context (e.g., exploration, danger, discovery).
        * Smooth transitions/fades between tracks.
6.  **Data Sonification (Scientific Immersion):**
    * Implement a system to convert simulated or real (catalog) data into audible representations, presented as if through scientific instruments:
        * **Pulsar Beams:** Rhythmic "beeps" or pulses.
        * **Radio Emissions:** (e.g., from Jupiter's magnetosphere) converted to audio-band signals.
        * **Gravitational Waves:** (e.g., from merging black holes) sonified as "chirps."
        * **Stellar "Sounds":** (e.g., helioseismology data or magnetic activity translated to sound).
    * This feature is for enhancing scientific immersion and education.
7.  **Audio Mixing & Effects:**
    * Master volume control, and separate controls for categories (SFX, music, voice, UI).
    * Basic audio effects: reverb (for interiors), filters.
    * Dynamic mixing to prioritize important sounds.

## 3. Technical Stack & Implementation Details

* **Primary Language:** C++ or Rust.
* **Audio Libraries:** Utilize a robust cross-platform audio library like OpenAL, FMOD (commercial, but powerful), Wwise (commercial), SoLoud, or miniaudio. The choice depends on licensing, features, and ease of integration.
* **Performance Considerations:**
    * Efficiently manage a large number of active sound emitters.
    * Streaming for long audio tracks (music, ambiances).
    * Minimize CPU overhead for audio processing.
* **Error Handling & Resilience:**
    * Handle missing audio files gracefully (e.g., play a default sound or silence with a warning).
    * Manage errors from the underlying audio library.
* **Logging:**
    * Log initialization of the audio system and chosen backend.
    * Log errors related to loading or playing sounds.
    * Log active music track changes.

## 4. Integration Points

* **Input (receives data from/is controlled by):**
    * Explorer's Interface (PVK, OITS, UIE): Triggers for ship sounds, UI sounds, player action sounds.
    * Physics Engine (NGO): For impact events, potentially for parameters driving physics-based sound modulation.
    * CosmicObjectDatabase (COD) & various simulation modules: For data to be sonified (e.g., pulsar timing, radio emission strength).
    * Continuum Core (Configuration System): For volume settings, audio device selection.
    * Event System: A general game event system could trigger many sounds.
* **Output:**
    * Audio output to the user's speakers/headphones.

## 5. Testing Strategy

* **Unit Tests:**
    * Test loading and basic playback of different audio file formats.
    * Test 3D positioning logic: verify panning and attenuation with distance.
    * Test Doppler effect calculations.
* **Functional Tests:**
    * Trigger various in-game events (engine start, jump, collision, UI click) and verify correct sounds are played with appropriate properties.
    * Test ambient soundscapes and music playback, including transitions.
    * Verify data sonification features produce expected audio representations.
* **Subjective Quality Assurance:**
    * Listen carefully to the overall mix in various scenarios. Are sounds clear? Is the balance good? Is it immersive?
    * Test on different audio hardware (headphones, stereo speakers, surround systems if supported).
* **Performance Tests:**
    * Measure CPU usage of the audio engine with many active sound sources.

## 6. Documentation

* Document the supported audio file formats and asset pipeline for audio.
* Explain how to use the sound emitter component and trigger sounds.
* Detail the 3D audio system's capabilities and parameters.
* Document the music system and how to manage dynamic music.
* Provide information on the data sonification system: what data can be sonified and how.
* List any third-party audio libraries used and their licensing.

## 7. Adherence to Project Principles

* **Active Observation:** Audio provides crucial feedback and enhances the player's sense of presence and interaction with the simulated universe.
* **Scientific Grounding (for Sonification):** Data sonification aims to represent scientific data in an accessible auditory form.
* **Modularity:** The AudioEngine should be a well-contained system, though its triggers will come from many other parts of the simulation.
