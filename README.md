x16_calc
Assembly Calculator (Bootloader)

A simple calculator written in x86 assembly (NASM) that runs as a bootloader. The program performs a hardcoded addition of two numbers (5 and 3), converts the result to a string, and displays it on the screen.
How to Build and Run

    Install NASM (nasm).
    Compile the code: nasm -f bin calculator.asm -o calculator.bin
    Run in an emulator or on real hardware (e.g., QEMU, Bochs, or a bootable floppy/USB):
        For QEMU: qemu-system-i386 -fda calculator.bin

Features

    Performs addition of two hardcoded integer values (5 and 3).
    Converts the numeric result to a string for display.
    Outputs the result to the screen using BIOS interrupts.

Limitations

    Only supports a single hardcoded operation (addition of 5 and 3).
    Works only with positive integers.
    No user input functionality.
    Designed to run as a bootloader at memory address 0x7c00.

Code Details

    Origin: The code starts at org 0x7c00, typical for boot sector programs.
    Operation: Adds two numbers (5 in AX and 3 in BX) using add.
    Conversion: Uses itoa routine to convert the result to a string.
    Output: Uses BIOS interrupt 0x10 to print the result character by character.
    Boot Signature: Ends with 0xAA55 to mark it as a valid boot sector.
