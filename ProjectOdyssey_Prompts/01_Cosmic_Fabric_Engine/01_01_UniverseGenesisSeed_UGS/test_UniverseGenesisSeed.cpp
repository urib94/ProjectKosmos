#include "UniverseGenesisSeed.hpp"
#include <cassert>
#include <iostream>

void test_set_get() {
    UniverseGenesisSeed ugs;
    ugs.set_master_seed_64(123456789ull);
    assert(ugs.get_master_seed_64() == 123456789ull);
    assert(ugs.is_master_seed_set());
    ugs.clear();
    UniverseGenesisSeed::Seed128 s128 = {0xABCDEF1234567890ull, 0x1234567890ABCDEFull};
    ugs.set_master_seed_128(s128);
    UniverseGenesisSeed::Seed128 out = ugs.get_master_seed_128();
    assert(out.high == 0xABCDEF1234567890ull && out.low == 0x1234567890ABCDEFull);
}

void test_derive() {
    UniverseGenesisSeed ugs;
    ugs.set_master_seed_64(42);
    auto s1 = ugs.derive_seed_64("test", 1);
    auto s2 = ugs.derive_seed_64("test", 2);
    assert(s1 != s2);
    assert(s1 == ugs.derive_seed_64("test", 1));
    ugs.clear();
    UniverseGenesisSeed::Seed128 s128 = {100, 200};
    ugs.set_master_seed_128(s128);
    auto d1 = ugs.derive_seed_128("mod", 99);
    auto d2 = ugs.derive_seed_128("mod", 100);
    assert(d1.high != d2.high || d1.low != d2.low);
    auto d1b = ugs.derive_seed_128("mod", 99);
    assert(d1.high == d1b.high && d1.low == d1b.low);
}

void test_export_import() {
    UniverseGenesisSeed ugs;
    ugs.set_master_seed_64(0xDEADBEEFCAFEBABEull);
    std::string s = ugs.export_seed_to_string();
    UniverseGenesisSeed ugs2;
    ugs2.import_seed_from_string(s);
    assert(ugs2.get_master_seed_64() == 0xDEADBEEFCAFEBABEull);
    ugs.clear();
    UniverseGenesisSeed::Seed128 s128 = {0x1111222233334444ull, 0x5555666677778888ull};
    ugs.set_master_seed_128(s128);
    std::string s2 = ugs.export_seed_to_string();
    UniverseGenesisSeed ugs3;
    ugs3.import_seed_from_string(s2);
    auto out = ugs3.get_master_seed_128();
    assert(out.high == 0x1111222233334444ull && out.low == 0x5555666677778888ull);
}

void test_edge_cases() {
    UniverseGenesisSeed ugs;
    ugs.set_master_seed_64(0);
    assert(ugs.get_master_seed_64() == 0);
    ugs.set_master_seed_64(~0ull);
    assert(ugs.get_master_seed_64() == ~0ull);
}

int main() {
    test_set_get();
    test_derive();
    test_export_import();
    test_edge_cases();
    std::cout << "All UniverseGenesisSeed tests passed!\n";
    return 0;
} 