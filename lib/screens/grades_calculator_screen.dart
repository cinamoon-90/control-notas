import 'package:flutter/material.dart';
import '../models/student_record.dart';
import '../widgets/grade_input_field.dart';
import '../widgets/grade_result_card.dart';

/// Pantalla principal para el ingreso de notas y cálculo de promedio.
class GradesCalculatorScreen extends StatefulWidget {
  const GradesCalculatorScreen({super.key});

  @override
  State<GradesCalculatorScreen> createState() => _GradesCalculatorScreenState();
}

class _GradesCalculatorScreenState extends State<GradesCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _p1Controller = TextEditingController();
  final TextEditingController _p2Controller = TextEditingController();
  final TextEditingController _p3Controller = TextEditingController();

  StudentRecord? _calculatedRecord;

  @override
  void dispose() {
    _nameController.dispose();
    _p1Controller.dispose();
    _p2Controller.dispose();
    _p3Controller.dispose();
    super.dispose();
  }

  void _calculateAverage() {
    // Cerrar el teclado
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final p1 = double.parse(_p1Controller.text.replaceAll(',', '.'));
      final p2 = double.parse(_p2Controller.text.replaceAll(',', '.'));
      final p3 = double.parse(_p3Controller.text.replaceAll(',', '.'));

      setState(() {
        _calculatedRecord = StudentRecord(
          studentName: name,
          partial1: p1,
          partial2: p2,
          partial3: p3,
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _calculatedRecord!.isApproved
                ? '¡Promedio calculado: Aprobado!'
                : '¡Promedio calculado: Alumno en Riesgo!',
          ),
          backgroundColor: _calculatedRecord!.statusColor,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _p1Controller.clear();
    _p2Controller.clear();
    _p3Controller.clear();
    setState(() {
      _calculatedRecord = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Control de Notas Universitarias',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (_calculatedRecord != null || _nameController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Limpiar campos',
              onPressed: _resetForm,
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Cabecera descriptiva
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: theme.colorScheme.primary,
                        child: const Icon(Icons.school, color: Colors.white),
                      ),
                      const SizedBox(width: 14.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gestión de Desempeño',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              'Ingresa los datos del alumno y las 3 notas parciales para evaluar su estatus académico.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),

                // Sección 1: Datos del Alumno
                Text(
                  'Datos del Estudiante',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Nombre del alumno',
                    hintText: 'Ej. Juan Carlos Pérez',
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.35),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor escribe el nombre del alumno';
                    }
                    if (value.trim().length < 3) {
                      return 'El nombre debe tener al menos 3 letras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),

                // Sección 2: Calificaciones Parciales
                Text(
                  'Calificaciones Parciales (0 - 10)',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12.0),
                GradeInputField(
                  controller: _p1Controller,
                  labelText: 'Calificación Parcial 1',
                  hintText: '0.0 a 10.0',
                  icon: Icons.looks_one_outlined,
                ),
                const SizedBox(height: 14.0),
                GradeInputField(
                  controller: _p2Controller,
                  labelText: 'Calificación Parcial 2',
                  hintText: '0.0 a 10.0',
                  icon: Icons.looks_two_outlined,
                ),
                const SizedBox(height: 14.0),
                GradeInputField(
                  controller: _p3Controller,
                  labelText: 'Calificación Parcial 3',
                  hintText: '0.0 a 10.0',
                  icon: Icons.looks_3_outlined,
                ),
                const SizedBox(height: 28.0),

                // Botón centrado: Calcular Promedio
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 54.0,
                    child: ElevatedButton.icon(
                      onPressed: _calculateAverage,
                      icon: const Icon(Icons.calculate_outlined, size: 22.0),
                      label: const Text(
                        'Calcular Promedio',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Área de resultado
                if (_calculatedRecord != null) ...[
                  GradeResultCard(record: _calculatedRecord!),
                  const SizedBox(height: 20.0),
                ] else ...[
                  // Estado inicial placeholder
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withOpacity(0.4),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.analytics_outlined,
                          size: 42.0,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Aún no has calculado el promedio',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Completa los datos y presiona el botón para visualizar el dictamen.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
