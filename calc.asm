org 0x7c00

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ax, 5
    mov bx, 3
    add ax, bx
    mov di, result
    call itoa
    mov si, result
    call print_string
    jmp $

print_string:
    mov ah, 0x0e
print_loop:
    lodsb
    cmp al, 0
    je print_done
    int 0x10
    jmp print_loop
print_done:
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
    mov byte [di], 0
    ret

section .data
result resb 10

times 510-($-$$) db 0
dw 0xAA55
