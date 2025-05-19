section .data
    dividendo dd 50       ; 32 bits
    divisor dd 7          ; 32 bits
    msg_cociente db "Cociente (32 bits): ", 0
    len_coc equ $ - msg_cociente
    msg_residuo db "Residuo (32 bits): ", 0
    len_res equ $ - msg_residuo
    newline db 10

section .bss
    buffer resb 11        ; Buffer para numeros (32 bits: hasta 10 digitos)

section .text
    global _start

_start:
    ; DIVISION (32 BITS)
    mov eax, [dividendo]  ; EAX = dividendo
    xor edx, edx          ; EDX = 0 (para division sin signo)
    mov ebx, [divisor]    ; EBX = divisor
    div ebx               ; EAX = cociente, EDX = residuo

    ; Guardar resultados
    push edx              ; Residuo en pila
    push eax              ; Cociente en pila

    ; IMPRIMIR COCIENTE
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, msg_cociente
    mov edx, len_coc
    int 0x80

    pop eax               ; Recuperar cociente
    call imprimir_numero

    ; IMPRIMIR RESIDUO
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_residuo
    mov edx, len_res
    int 0x80

    pop eax               ; Recuperar residuo
    call imprimir_numero

    ; === FINALIZAR ===
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; status 0
    int 0x80

imprimir_numero:
    ; Subrutina para imprimir EAX (32 bits)
    mov edi, buffer+10    ; Puntero al final del buffer
    mov ecx, 10           ; Base decimal

.convertir:
    xor edx, edx          ; Limpiar EDX para division
    div ecx               ; EDX:EAX / 10
    add dl, '0'           ; Convertir a ASCII
    dec edi
    mov [edi], dl
    test eax, eax         ; ¿Cociente = 0?
    jnz .convertir

    ; Calcular longitud
    mov ecx, edi          ; Puntero al inicio
    mov edx, buffer+11
    sub edx, edi          ; Longitud = (buffer+11) - EDI

    ; Imprimir
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Imprimir nueva linea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret
