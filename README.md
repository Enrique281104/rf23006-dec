# Guía de Ensamblador - rf23006

**Carnet**: rf23006  
**Nombre**: Enrique Guillermo Rivera Flores  
**Asignatura**: Diseño y Estructura de Computadoras  
**Ciclo**: I/2025  
**Facultad**: Ingeniería en Desarrollo de Software  

---

## Configuración del Entorno

**Sistema Operativo:** Windows 10  
**Subsistema:** WSL2 con Ubuntu  
**Herramientas necesarias:**

```bash
sudo apt update
sudo apt install nasm  
```

## Ejercicios Resueltos  

**1. Resta de tres números enteros (16 bits)**

- Usa registros AX para operaciones de 16 bits    
- movzx eax, ax extiende el resultado a 32 bits para la conversión  
- La conversión a ASCII funciona de derecha a izquierda en el buffer  

```bash
mov ax, [num1]  ; Cargar primer número  
sub ax, [num2]  ; Restar segundo número  
sub ax, [num3]  ; Restar tercer número  
```

Compilación y ejecución:
```bash
nasm -f elf32 resta.asm -o resta.o
ld -m elf_i386 resta.o -o resta
./resta
```

**2. Multiplicación de dos números enteros (8 bits)**

- Usa mul bl (resultado en AX)  
- Solo utiliza AL porque el resultado cabe en 8 bits (5×3=15)  
- El buffer es de 3 bytes (suficiente para valores ≤ 255)  

```bash
mov al, [num1]  ; Cargar primer número  
mov bl, [num2]  ; Cargar segundo número  
mul bl          ; AX = AL * BL  
```

Compilación y ejecución:
```bash
nasm -f elf32 multiplicacion.asm -o multiplicacion.o
ld -m elf_i386 multiplicacion.o -o multiplicacion
./multiplicacion
```

**3. División de dos números enteros (32 bits)**

- xor edx, edx limpia EDX para división sin signo  
- Usa div ebx (cociente en EAX, residuo en EDX)  
- Implementa una subrutina reutilizable (imprimir_numero)  

```bash
mov eax, [dividendo]  ; Cargar dividendo  
xor edx, edx          ; Limpiar EDX (necesario para división)  
div ebx               ; EAX = cociente, EDX = residuo  
```

Compilación y ejecución:

```bash
nasm -f elf32 division.asm -o division.o
ld -m elf_i386 division.o -o division
./division
```

## Autor  
**Nombre:** Enrique Guillermo Rivera Flores  
**Carnet:** rf23006  
**Usuario de GitHub:** Enrique281104  
