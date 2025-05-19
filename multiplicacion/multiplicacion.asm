section .data
    num1 db 5        ; 8 bits
    num2 db 3        ; 8 bits
    msg db "Multiplicacion (8 bits): "
    len equ $ - msg
    newline db 10

section .bss
    buffer resb 3    ; Buffer para numero (max 255 = 3 digitos)

section .text
    global _start

_start:
    ; MULTIPLICACION
    mov al, [num1]   ; AL = primer numero (8 bits)
    mov bl, [num2]   ; BL = segundo numero (8 bits)
    mul bl           ; AX = AL * BL (resultado en AX, pero solo usamos AL)

    ; CONVERSION (usamos solo AL)
    movzx eax, al    ; Extendemos AL a 32 bits (sin signo)
    mov edi, buffer+2 ; Puntero al final del buffer
    mov ecx, 10      ; Base 10

convert:
    xor edx, edx
    div ecx          ; EDX:EAX / 10
    add dl, '0'      ; Convertir a ASCII
    dec edi
    mov [edi], dl
    test eax, eax
    jnz convert

    ; IMPRESION
    ; Mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Numero
    mov eax, 4
    mov ecx, edi
    mov edx, buffer+3
    sub edx, edi     ; Longitud
    int 0x80

    ; Nueva linea
    mov eax, 4
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80
