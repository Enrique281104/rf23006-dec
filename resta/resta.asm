section .data
    num1 dw 30
    num2 dw 10
    num3 dw 5
    msg db "Resultado (16 bits): "
    len equ $ - msg
    newline db 10

section .bss
    buffer resb 6    ; Espacio para el numero

section .text
    global _start

_start:
    ; RESTA (16 bits)
    mov ax, [num1]
    sub ax, [num2]
    sub ax, [num3]   ; AX = resultado (16 bits)

    ; CONVERSION
    movzx eax, ax    ; Extender a 32 bits
    mov edi, buffer+5 ; Puntero al final del buffer
    mov ecx, 10      ; Base decimal

convert:
    xor edx, edx
    div ecx          ; EDX:EAX / 10
    add dl, '0'      ; Convertir a ASCII
    dec edi
    mov [edi], dl
    test eax, eax
    jnz convert

    ; IMPRESION
    ; Imprimir mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Imprimir numero
    mov eax, 4
    mov ebx, 1
    mov ecx, edi     ; Puntero al inicio del numero
    mov edx, buffer+6
    sub edx, edi     ; Calcular longitud
    int 0x80

    ; Nueva linea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir
    mov eax, 1
    xor ebx, ebx
    int 0x80
