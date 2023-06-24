import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/task_text/task_text_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    final readTaskTextProvider = context.read<TaskTextProvider>();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 2),
            blurRadius: 2.0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Пожалуйста, введите вашу задачу';
          }
          return null;
        },
        onChanged: (value) {
          readTaskTextProvider.setTaskText = value;
        },
        style: FontConstants.body.copyWith(
          color: colorProvider.labelPrimary,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Что надо сделать...',
          hintStyle: FontConstants.body.copyWith(
            color: colorProvider.labelTertiary,
          ),
          fillColor: Colors.white,
          filled: true,
          counterText: '',
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
