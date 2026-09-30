import 'package:flutter/material.dart';

/// Modelo de datos y lógica de negocio para la calificación del estudiante.
class StudentRecord {
  final String studentName;
  final double partial1;
  final double partial2;
  final double partial3;

  StudentRecord({
    required this.studentName,
    required this.partial1,
    required this.partial2,
    required this.partial3,
  });

  /// Calcula el promedio aritmético de los tres parciales.
  double get average => (partial1 + partial2 + partial3) / 3.0;

  /// Determina si el alumno ha aprobado (nota mínima 6.0).
  bool get isApproved => average >= 6.0;

  /// Mensaje descriptivo del estado del alumno.
  String get statusMessage =>
      isApproved ? '✅ Alumno Aprobado' : '⚠️ Alumno en Riesgo';

  /// Color semántico según la condición académica.
  Color get statusColor =>
      isApproved ? const Color(0xFF2E7D32) : const Color(0xFFC62828);

  /// Color de fondo sutil para tarjetas o banners.
  Color get statusBackgroundColor =>
      isApproved ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE);

  /// Promedio formateado a dos decimales.
  String get formattedAverage => average.toStringAsFixed(2);
}
