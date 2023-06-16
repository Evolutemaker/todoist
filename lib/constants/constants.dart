import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/enums.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

Map<TaskPriority, String> priorityTitles = {
  TaskPriority.no: 'Нет',
  TaskPriority.low: 'Низкий',
  TaskPriority.high: '!! Высокий',
};

Future<DateTime?> targetDate(BuildContext context, {DateTime? pastDate}) async {
  DateTime? selectedDate = await showDialog(
    context: context,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (_) => ThemeProvider(context),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.watch<ThemeProvider>().blue,
              onPrimary: context.watch<ThemeProvider>().backSecondary,
              surface: context.watch<ThemeProvider>().labelPrimary,
              onSurface: context.watch<ThemeProvider>().labelPrimary,
            ),
            textTheme: const TextTheme(
              labelSmall: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: DatePickerDialog(
            initialDate: pastDate ?? DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            confirmText: 'ГОТОВО',
            helpText: DateFormat.y().format(DateTime.now()),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
          ),
        ),
      );
    },
  );

  return selectedDate;
}
