# 🎮 Mata a los Murcielagos Gordos

## 🚀 Cómo Ejecutar el Juego

### **Opción 1: Script de Ejecución (Recomendado)**
```bash
./run_game.sh
```

### **Opción 2: Ejecutar Directamente con Godot**
```bash
/Applications/Godot.app/Contents/MacOS/godot project.godot
```

### **Opción 3: Abrir en Godot Editor**
1. Abrir Godot Engine
2. Importar proyecto desde esta carpeta
3. Presionar F5 o "Play"

## 🎯 Controles del Juego

- **Movimiento**: WASD o Flechas del teclado
- **Ataque**: Z o Click Izquierdo del mouse
- **Combo**: Presiona ataque 3 veces seguidas para combo completo

## ⚔️ Sistema de Combate

1. **Primer Ataque**: Estocada rápida hacia adelante
2. **Segundo Ataque**: Corte horizontal más amplio
3. **Tercer Ataque**: Giro 360° devastador

**Ventana de Combo**: 1 segundo entre ataques
**Cooldown**: 0.5 segundos después del combo completo

## 🎮 Objetivo del Juego

- Elimina a los murciélagos gordos usando tu espada
- Evita que te toquen o perderás
- Sobrevive el mayor tiempo posible
- ¡Usa los combos para eliminar múltiples enemigos!

## 📋 Requisitos del Sistema

- **macOS**: 10.12 o superior
- **Godot Engine**: 4.4.1 o superior instalado
- **RAM**: 512 MB mínimo
- **Espacio**: 50 MB

## 🛠️ Archivos Incluidos

```
build/
├── art/                    # Sprites y recursos gráficos
├── fonts/                  # Fuentes del juego
├── *.gd                   # Scripts de GDScript
├── *.tscn                 # Escenas de Godot
├── project.godot          # Configuración del proyecto
├── run_game.sh           # Script de ejecución
└── README.md             # Este archivo
```

## 🎨 Créditos

- **Desarrollo**: Sistema de espada implementado con Godot 4.4
- **Base**: Tutorial "Your First 2D Game" de Godot
- **Mecánicas Añadidas**: Sistema de combos de 3 ataques
- **Localización**: Textos en español

## 🐛 Solución de Problemas

**Si el juego no inicia:**
1. Verificar que Godot esté instalado en `/Applications/Godot.app/`
2. Dar permisos de ejecución: `chmod +x run_game.sh`
3. Ejecutar desde terminal para ver errores

**Si hay problemas de rendimiento:**
- Cerrar otras aplicaciones
- Verificar que el sistema cumpla los requisitos mínimos

**Si los controles no responden:**
- Verificar que el juego tenga foco (click en la ventana)
- Probar con teclado y mouse diferentes

## 📞 Soporte

Para reportar bugs o sugerencias, revisar los archivos de configuración en el proyecto fuente.

¡Disfruta eliminando murciélagos gordos! 🦇⚔️