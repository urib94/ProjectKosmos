#include "UniverseGenesisSeed.hpp"
#include <sstream>
#include <iomanip>
#include <cstring>
#include <stdexcept>

void UniverseGenesisSeed::set_master_seed_64(Seed64 new_seed) {
    std::lock_guard<std::mutex> lock(mtx);
    master_seed_64 = new_seed;
    use_128 = false;
    seed_set = true;
}

void UniverseGenesisSeed::set_master_seed_128(Seed128 new_seed) {
    std::lock_guard<std::mutex> lock(mtx);
    master_seed_128 = new_seed;
    use_128 = true;
    seed_set = true;
}

UniverseGenesisSeed::Seed64 UniverseGenesisSeed::get_master_seed_64() const {
    std::lock_guard<std::mutex> lock(mtx);
    if (!seed_set) throw std::runtime_error("Master seed not set");
    if (use_128) throw std::runtime_error("Master seed is 128-bit, use get_master_seed_128()");
    return master_seed_64;
}

UniverseGenesisSeed::Seed128 UniverseGenesisSeed::get_master_seed_128() const {
    std::lock_guard<std::mutex> lock(mtx);
    if (!seed_set) throw std::runtime_error("Master seed not set");
    if (!use_128) throw std::runtime_error("Master seed is 64-bit, use get_master_seed_64()");
    return master_seed_128;
}

bool UniverseGenesisSeed::is_master_seed_set() const {
    std::lock_guard<std::mutex> lock(mtx);
    return seed_set;
}

// Simple deterministic hash for seed derivation (FNV-1a variant for demo)
static uint64_t fnv1a_hash(const std::string& str, uint64_t seed) {
    uint64_t hash = 14695981039346656037ull ^ seed;
    for (char c : str) {
        hash ^= static_cast<uint8_t>(c);
        hash *= 1099511628211ull;
    }
    return hash;
}

UniverseGenesisSeed::Seed64 UniverseGenesisSeed::derive_seed_64(const std::string& context_name, uint64_t specific_identifier) const {
    std::lock_guard<std::mutex> lock(mtx);
    if (!seed_set) throw std::runtime_error("Master seed not set");
    uint64_t base = use_128 ? master_seed_128.low : master_seed_64;
    uint64_t hash = fnv1a_hash(context_name, base);
    return hash ^ specific_identifier;
}

UniverseGenesisSeed::Seed128 UniverseGenesisSeed::derive_seed_128(const std::string& context_name, uint64_t specific_identifier) const {
    std::lock_guard<std::mutex> lock(mtx);
    if (!seed_set) throw std::runtime_error("Master seed not set");
    Seed128 out;
    if (use_128) {
        out.high = fnv1a_hash(context_name, master_seed_128.high) ^ specific_identifier;
        out.low  = fnv1a_hash(context_name, master_seed_128.low) ^ specific_identifier;
    } else {
        out.high = fnv1a_hash(context_name, master_seed_64) ^ specific_identifier;
        out.low  = fnv1a_hash(context_name, master_seed_64 ^ 0xDEADBEEFCAFEBABEull) ^ specific_identifier;
    }
    return out;
}

std::string UniverseGenesisSeed::export_seed_to_string() const {
    std::lock_guard<std::mutex> lock(mtx);
    std::ostringstream oss;
    if (use_128) {
        oss << std::hex << std::setw(16) << std::setfill('0') << master_seed_128.high << ":"
            << std::setw(16) << std::setfill('0') << master_seed_128.low;
    } else {
        oss << std::hex << std::setw(16) << std::setfill('0') << master_seed_64;
    }
    return oss.str();
}

bool UniverseGenesisSeed::import_seed_from_string(const std::string& seed_str) {
    std::lock_guard<std::mutex> lock(mtx);
    if (seed_str.find(":") != std::string::npos) {
        // 128-bit
        size_t sep = seed_str.find(":");
        std::string high_str = seed_str.substr(0, sep);
        std::string low_str = seed_str.substr(sep + 1);
        master_seed_128.high = std::stoull(high_str, nullptr, 16);
        master_seed_128.low  = std::stoull(low_str, nullptr, 16);
        use_128 = true;
    } else {
        master_seed_64 = std::stoull(seed_str, nullptr, 16);
        use_128 = false;
    }
    seed_set = true;
    return true;
}

void UniverseGenesisSeed::clear() {
    std::lock_guard<std::mutex> lock(mtx);
    master_seed_64 = 0;
    master_seed_128 = {0, 0};
    use_128 = false;
    seed_set = false;
} 