# rf23006-dec - Guía de Ensamblador (UES)

**Carnet**: rf23006  
**Asignatura**: Diseño y Estructura de Computadoras  
**Ciclo**: I/2025  
**Facultad**: Ingeniería en Desarrollo de Software  

## 🧮 Ejercicios Resueltos

### 1. Resta de tres números enteros (16 bits)
```asm
mov ax, [num1]  ; Cargar valores
sub ax, [num2]  ; Restar
sub ax, [num3]  ; Restar

### Compilar y ejecutar

```bash
nasm -f elf32 resta.asm -o resta.o
ld -m elf_i386 resta.o -o resta
./resta



### 2. Multiplicación de dos números enteros (8 bits)
```asm
mov al, [num1]  ; Cargar valores
mov bl, [num2]
mul bl          ; AX = AL * BL

### Compilar y ejecutar

```bash
nasm -f elf32 multiplicacion.asm -o multiplicacion.o
ld -m elf_i386 multiplicacion.o -o multiplicacion
./multiplicacion



### 3. División de dos números enteros (8 bits)
```asm
mov eax, [dividendo]
xor edx, edx    ; Limpiar EDX
div ebx         ; EAX = cociente, EDX = residuo

### Compilar y ejecutar

```bash
nasm -f elf32 division.asm -o division.o
ld -m elf_i386 division.o -o division
./division



### Configuración

Sistema: Windows 10 + WSL2/Ubuntu
Herramientas:
```bash
sudo apt install nasm gcc build-essential


### Autor

Estudiante: Enrique Guillermo Rivera Flores
Carnet: rf23006
GitHub: Enrique281104