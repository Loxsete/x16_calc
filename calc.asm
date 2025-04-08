section .text
    org 0x100

_start:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov ah, 09h
    mov dx, msg1
    int 21h

    mov ah, 0Ah
    mov dx, num1
    int 21h

    mov ah, 09h
    mov dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    mov [op], al

    mov ah, 09h
    mov dx, newline
    int 21h

    mov ah, 09h
    mov dx, msg3
    int 21h

    mov ah, 0Ah
    mov dx, num2
    int 21h

    mov si, num1 + 2
    call atoi
    mov bx, ax

    mov si, num2 + 2
    call atoi
    mov cx, ax

    mov al, [op]
    cmp al, '+'
    je do_add
    cmp al, '-'
    je do_sub
    cmp al, '*'
    je do_mul
    cmp al, '/'
    je do_div

    mov ah, 09h
    mov dx, msg_err
    int 21h
    jmp exit

do_add:
    add bx, cx
    jmp calculate_done

do_sub:
    sub bx, cx
    jmp calculate_done

do_mul:
    mov ax, bx
    mul cx
    mov bx, ax
    jmp calculate_done

do_div:
    mov ax, bx
    xor dx, dx
    div cx
    mov bx, ax
    jmp calculate_done

calculate_done:
    mov ah, 09h
    mov dx, msg4
    int 21h

    mov ax, bx
    mov di, result
    call itoa

    mov ah, 09h
    mov dx, result
    int 21h

    mov ah, 09h
    mov dx, newline
    int 21h

exit:
    mov ah, 4Ch
    mov al, 0
    int 21h

atoi:
    xor ax, ax
    xor bx, bx
atoi_loop:
    mov bl, [si]
    cmp bl, 13
    je atoi_done
    cmp bl, 0
    je atoi_done
    sub bl, '0'
    imul ax, 10
    add ax, bx
    inc si
    jmp atoi_loop
atoi_done:
    ret

itoa:
    mov bx, 10
    xor cx, cx
itoa_loop1:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    test ax, ax
    jnz itoa_loop1

itoa_loop2:
    pop ax
    mov [di], al
    inc di
    loop itoa_loop2
    mov byte [di], '$'
    ret

section .data
    msg1 db "Enter the first number: $"
    msg2 db "Enter the operation (+, -, *, /): $"
    msg3 db "Enter the second number: $"
    msg4 db "Result: $"
    msg_err db "Error: unknown operation$"
    newline db 13, 10, '$'

section .bss
    num1 resb 10
    num2 resb 10
    op   resb 1
    result resb 10