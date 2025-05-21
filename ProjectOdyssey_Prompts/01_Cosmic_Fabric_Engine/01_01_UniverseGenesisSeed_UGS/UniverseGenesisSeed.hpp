#pragma once
#include <cstdint>
#include <string>
#include <mutex>

// UniverseGenesisSeed (UGS) - Master seed manager for deterministic universe generation
// See prompt.md for full requirements and API details

class UniverseGenesisSeed {
public:
    using Seed64 = uint64_t;
    using Seed128 = struct { uint64_t high; uint64_t low; };

    // Set the master seed (64 or 128 bit)
    void set_master_seed_64(Seed64 new_seed);
    void set_master_seed_128(Seed128 new_seed);

    // Get the master seed
    Seed64 get_master_seed_64() const;
    Seed128 get_master_seed_128() const;

    // Check if master seed is set
    bool is_master_seed_set() const;

    // Deterministically derive a sub-seed for a given context and identifier
    Seed64 derive_seed_64(const std::string& context_name, uint64_t specific_identifier) const;
    Seed128 derive_seed_128(const std::string& context_name, uint64_t specific_identifier) const;

    // Export/import seed as string (for shareability)
    std::string export_seed_to_string() const;
    bool import_seed_from_string(const std::string& seed_str);

    // Reset/clear the master seed
    void clear();

private:
    mutable std::mutex mtx;
    Seed64 master_seed_64 = 0;
    Seed128 master_seed_128 = {0, 0};
    bool use_128 = false;
    bool seed_set = false;
}; 