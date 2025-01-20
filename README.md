# RISC-V Optimized memset

This repository contains an optimized RISC-V assembly implementation of `memset` that improves performance for cases where the size of memory to set (`a2`) is a multiple of 4.

## Features
- Optimized for word-aligned memory writes.
- Handles misaligned memory writes gracefully.
- Small code size to reduce static code footprint.

## Usage
### Build and Test
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/riscv-memset.git
   cd riscv-memset
