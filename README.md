# x16_calc

# Assembly Calculator (DOS)

A simple calculator for DOS written in assembly (NASM). The program prompts for two numbers and an operation (+, -, *, /), performs the calculation, and displays the result.

## How to Build and Run
1. Install NASM (`nasm`).
2. Compile the code: `nasm -f bin calculator.asm -o calculator.com`
3. Run in a DOS emulator (e.g., DOSBox): `calculator.com`

## Features
- Supports addition, subtraction, multiplication, and division.
- Handles integer numbers.
- Displays an error for invalid operations.

## Limitations
- Works only with integers.
- Does not support negative numbers or large values.
