# 🧠 Guía de Ensamblador - rf23006

**Carnet**: rf23006  
**Nombre**: Enrique Guillermo Rivera Flores  
**Asignatura**: Diseño y Estructura de Computadoras  
**Ciclo**: I/2025  
**Facultad**: Ingeniería en Desarrollo de Software  

---

## ⚙️ Configuración del Entorno

**Sistema Operativo:** Windows 10  
**Subsistema:** WSL2 con Ubuntu  
**Herramientas necesarias:**

```bash
sudo apt update
sudo apt install nasm gcc build-essential

🧮 Ejercicios Resueltos
1️⃣ Resta de tres números enteros (16 bits)

mov ax, [num1]  ; Cargar primer número
sub ax, [num2]  ; Restar segundo número
sub ax, [num3]  ; Restar tercer número

Compilación y ejecución:

nasm -f elf32 resta.asm -o resta.o
ld -m elf_i386 resta.o -o resta
./resta

2️⃣ Multiplicación de dos números enteros (8 bits)

mov al, [num1]  ; Cargar primer número
mov bl, [num2]  ; Cargar segundo número
mul bl          ; AX = AL * BL

Compilación y ejecución:

nasm -f elf32 multiplicacion.asm -o multiplicacion.o
ld -m elf_i386 multiplicacion.o -o multiplicacion
./multiplicacion

3️⃣ División de dos números enteros (8 bits)

mov eax, [dividendo]  ; Cargar dividendo
xor edx, edx          ; Limpiar EDX (necesario para división)
div ebx               ; EAX = cociente, EDX = residuo

Compilación y ejecución:

nasm -f elf32 division.asm -o division.o
ld -m elf_i386 division.o -o division
./division

👨‍💻 Autor
Nombre: Enrique Guillermo Rivera Flores
Carnet: rf23006
GitHub: Enrique281104
