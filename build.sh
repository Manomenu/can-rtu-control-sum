#!/usr/bin/env bash
# build.sh — kompilacja aplikacji CAN CRC-15

set -euo pipefail
cd "$(dirname "$0")"

COMPILER="${CXX:-clang++}"
if ! command -v "$COMPILER" &>/dev/null; then
    COMPILER="g++"
fi

CXXFLAGS="-std=c++17 -O3 -march=native -Wall -Wextra"

echo "Kompilacja: ${COMPILER} ${CXXFLAGS}"
$COMPILER $CXXFLAGS -o can_crc src/main.cpp
echo "OK — zbudowano: ./can_crc"
