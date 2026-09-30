import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Campo de texto personalizado y validado para notas de parciales (0.0 a 10.0).
class GradeInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;

  const GradeInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = 'Ej. 8.5',
    this.icon = Icons.assignment_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        // Permite números y un punto o coma decimal
        FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d*')),
      ],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        suffixText: '/ 10',
        suffixStyle: TextStyle(
          color: Theme.of(context).colorScheme.outline,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.35),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Color(0xFFC62828), width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Por favor ingresa la calificación';
        }
        final normalizedValue = value.replaceAll(',', '.');
        final grade = double.tryParse(normalizedValue);
        if (grade == null) {
          return 'Ingresa un valor numérico válido';
        }
        if (grade < 0.0 || grade > 10.0) {
          return 'La nota debe estar entre 0.0 y 10.0';
        }
        return null;
      },
    );
  }
}
