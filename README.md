# 📱 Control de Notas Universitarias - Flutter App

Prototipo de aplicación móvil desarrollado con **Flutter** y **Material Design 3** para la gestión y cálculo automatizado del promedio de calificaciones de alumnos universitarios.

---

## 🎯 Requisitos Implementados

1. **Título Superior:** "Control de Notas Universitarias" en la barra de navegación principal.
2. **Nombre del Alumno:** Campo de texto con validación requerida.
3. **Calificaciones de Parciales:** Tres campos numéricos con validación de rango estricta (escala de 0.0 a 10.0) y soporte para decimales (`.` o `,`).
4. **Botón Centrado:** "Calcular Promedio" con diseño elevado accesible.
5. **Área de Resultado:** Tarjeta visual dinámica con desglose:
   - **Promedio < 6.0:** Indicador y texto en color **Rojo** con el mensaje `⚠️ Alumno en Riesgo`.
   - **Promedio >= 6.0:** Indicador y texto en color **Verde** con el mensaje `✅ Alumno Aprobado`.

---

## 📂 Estructura del Proyecto

```text
control_notas_app/
├── android/
│   └── app/src/main/
│       └── AndroidManifest.xml          # Configuración nativa Android
├── lib/
│   ├── models/
│   │   └── student_record.dart         # Modelo de datos y lógica del promedio
│   ├── screens/
│   │   └── grades_calculator_screen.dart # Pantalla principal con formulario y lógica UI
│   ├── widgets/
│   │   ├── grade_input_field.dart      # Componente de entrada para notas (0 a 10)
│   │   └── grade_result_card.dart      # Tarjeta visual con feedback condicional
│   └── main.dart                       # Punto de entrada y tema institucional
├── pubspec.yaml                        # Dependencias y configuración de Flutter
└── README.md                           # Documentación del proyecto
```

---

## 🚀 Cómo ejecutar la aplicación

### Prerrequisitos
- Tener instalado el SDK de Flutter (versión 3.0.0 o superior).
- Dispositivo Android físico en modo depuración o emulador Android (AVD) / Chrome.

### Pasos
1. Abre una terminal dentro de la carpeta del proyecto:
   ```bash
   cd "control_notas_app"
   ```

2. Descarga las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:
   ```bash
   # En emulador o dispositivo conectado
   flutter run

   # O para probar en navegador web
   flutter run -d chrome
   ```

---

## 🧪 Casos de Prueba

| Caso | Alumno | Parcial 1 | Parcial 2 | Parcial 3 | Promedio Final | Estado Resultante |
| :--- | :--- | :---: | :---: | :---: | :---: | :--- |
| **1** | Ana Sofía Ruiz | `8.5` | `9.0` | `7.0` | **8.17** | 🟢 **✅ Alumno Aprobado** |
| **2** | Carlos Méndez | `5.0` | `6.0` | `5.5` | **5.50** | 🔴 **⚠️ Alumno en Riesgo** |
| **3** | Laura Gómez | `6.0` | `6.0` | `6.0` | **6.00** | 🟢 **✅ Alumno Aprobado** |
| **4** | Validación de Error | `11.5` | `-1` | `abc` | - | ❌ Muestra mensaje de validación (rango 0 a 10) |
