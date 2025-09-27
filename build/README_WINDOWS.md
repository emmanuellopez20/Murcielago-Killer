# 🎮 Mata a los Murcielagos Gordos - Windows

## 🚀 Instalación y Ejecución Rápida

### **Opción 1: Configuración Automática (Recomendada)**
1. **Ejecutar `setup_windows.bat`**
2. **Seguir las instrucciones en pantalla**
3. **¡Listo para jugar!**

### **Opción 2: Ejecución Directa**
1. **Ejecutar `run_game_windows.bat`**
2. **Si no tienes Godot, te dará instrucciones**

## 📥 Requisitos

### **Godot Engine (Requerido)**
- **Versión**: 4.4.1 o superior
- **Descarga**: https://godotengine.org/download/windows/
- **Tamaño**: ~40 MB
- **Instalación**: No requiere instalador, es portable

### **Sistema**
- **Windows**: 7/8/10/11 (64-bit)
- **RAM**: 512 MB mínimo
- **Espacio**: 100 MB total (juego + Godot)

## 🎯 Opciones de Instalación de Godot

### **1. Instalación Estándar**
```
C:\Program Files\Godot\godot.exe
```

### **2. Instalación Portable (Más Fácil)**
```
[Carpeta del juego]\godot.exe
```
- Descarga Godot
- Extrae el ZIP
- Copia `godot.exe` a la carpeta del juego
- ¡Listo!

### **3. Ubicaciones Automáticamente Detectadas**
El script busca Godot en:
- `C:\Program Files\Godot\godot.exe`
- `C:\Program Files (x86)\Godot\godot.exe`
- `%USERPROFILE%\Desktop\Godot\godot.exe`
- `%USERPROFILE%\Downloads\Godot\godot.exe`
- `godot.exe` (en la carpeta del juego)

## 🎮 Controles del Juego

- **Movimiento**: WASD o Flechas
- **Ataque**: Z o Click Izquierdo
- **Combo**: Presiona ataque 3 veces seguidas

## ⚔️ Sistema de Combate

1. **Primer Ataque**: Estocada rápida
2. **Segundo Ataque**: Corte horizontal amplio
3. **Tercer Ataque**: Giro 360° devastador

**Timing**: 1 segundo entre ataques para mantener combo

## 🛠️ Solución de Problemas

### **"No se encontró Godot Engine"**
**Solución:**
1. Ejecutar `setup_windows.bat`
2. Seguir instrucciones de descarga
3. Colocar `godot.exe` en la carpeta del juego

### **"El juego no inicia"**
**Verificar:**
- Godot está en una ubicación detectada
- Todos los archivos del juego están presentes
- Windows no está bloqueando la ejecución

### **"Rendimiento lento"**
**Optimizar:**
- Cerrar otras aplicaciones
- Verificar que el PC cumpla requisitos mínimos
- Ejecutar como administrador si es necesario

### **"Controles no responden"**
**Solucionar:**
- Click en la ventana del juego para dar foco
- Verificar que no hay otros programas capturando input
- Probar con teclado diferente

## 📁 Estructura de Archivos

```
Mata a los Murcielagos Gordos/
├── setup_windows.bat          # Configurador automático
├── run_game_windows.bat       # Ejecutor del juego
├── godot.exe                  # Motor Godot (después de instalación)
├── project.godot              # Configuración del proyecto
├── art/                       # Recursos gráficos y audio
├── fonts/                     # Fuentes del juego
├── *.gd                      # Scripts del juego
├── *.tscn                    # Escenas del juego
└── README_WINDOWS.md         # Este archivo
```

## 🎯 Pasos Rápidos para Jugar

### **Primera Vez:**
1. `setup_windows.bat` → Configurar
2. `run_game_windows.bat` → Jugar

### **Siguientes Veces:**
1. `run_game_windows.bat` → ¡Directo a jugar!

## 🔄 Actualizaciones

Para actualizar el juego:
1. Reemplazar archivos del juego (mantener `godot.exe`)
2. Ejecutar normalmente

Para actualizar Godot:
1. Descargar nueva versión
2. Reemplazar `godot.exe`
3. Ejecutar normalmente

## 📞 Soporte Técnico

**Si tienes problemas:**
1. Ejecutar `setup_windows.bat` nuevamente
2. Verificar que tienes la versión correcta de Godot
3. Revisar que Windows no esté bloqueando archivos

## 🎮 ¡A Jugar!

Una vez configurado, simplemente ejecuta:
```
run_game_windows.bat
```

¡Disfruta eliminando murciélagos gordos! 🦇⚔️

---

**Nota**: Este juego es completamente gratuito y de código abierto. Godot Engine también es gratuito y open source.