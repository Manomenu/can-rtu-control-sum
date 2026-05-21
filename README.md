# can-rtu-control-sum

Aplikacja wyznaczająca sumę kontrolną CRC-15 dla sieci CAN oraz analiza czasu
transmisji ramki CAN z bit stuffingiem.
Projekt realizuje zadania 4.1, 4.2 i 4.3 z laboratorium *Systemy czasu rzeczywistego* (EiTI PW).

## Dlaczego C++, nie Python?

Zadanie 4.1 wymaga dostarczenia aplikacji **w postaci kodu maszynowego wykonywalnego**
i optymalizacji pod kątem minimalizacji czasu realizacji algorytmu (do 10⁹ powtórzeń).
Python byłby ~100× wolniejszy i nie generuje natywnego kodu maszynowego bez dodatkowych narzędzi.
C++ kompilowany z `-O3 -march=native` jest naturalnym i jedynym właściwym wyborem.

## Wymagania

- macOS / Linux
- `clang++` (≥ 14) lub `g++` (≥ 11) z obsługą C++17
- [`just`](https://github.com/casey/just) — opcjonalny menedżer zadań

## Budowanie i uruchamianie

**Przez `just`:**
```bash
just        # build
just run    # build + uruchom
just clean  # usuń plik wykonywalny
```

**Przez bash:**
```bash
bash build.sh          # kompilacja
bash run_zadanie41.sh  # interaktywny runner
```

**Ręcznie:**
```bash
clang++ -std=c++17 -O3 -march=native -o can_crc src/main.cpp
./can_crc
```

## Parametry zadania 4.1

| Parametr | Wartość |
|----------|---------|
| Wielomian CRC-15/CAN | `G(x) = x¹⁵ + x¹⁴ + x¹⁰ + x⁸ + x⁷ + x⁴ + x³ + 1` |
| Reprezentacja wielomianu | `0x4599` (bez bitu x¹⁵) |
| Inicjalizacja rejestru | `CRC_RG = 0` |
| Wejście | ciąg do 96 bitów ('0'/'1') z klawiatury |
| Wyjście | CRC w postaci szesnastkowej |
| Liczba powtórzeń | 1 – 10⁹ |

## Struktura projektu

```
├── src/
│   └── main.cpp              implementacja CRC-15/CAN + CLI
├── .raport/
│   └── projekt_4.tex         sprawozdanie LaTeX
├── build.sh                  skrypt kompilacji
├── run_zadanie41.sh          interaktywny runner zadania 4.1
├── shared.sh                 wspólna logika bash (kolory, budowanie)
└── justfile                  alternatywne polecenia budowania
```
