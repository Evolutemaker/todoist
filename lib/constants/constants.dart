import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/enums.dart';
import 'package:todoist/constants/exception_messages.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

var logFile = File('exceptions/exceptions.log');

Map<int, String> messageException = {
  400: ExceptionMessages.complexExceptionMessage,
  401: ExceptionMessages.wrongAuthExceptionMessage,
  404: ExceptionMessages.noElementExceptionMessage,
  500: ExceptionMessages.serverExceptionMessage,
};

var logger = Logger(
  printer: PrettyPrinter(),
  output: FileOutput(
    file: logFile,
  ),
);

DateTime? getDateTimeFromTimestamp(int? timestamp) {
  if (timestamp == null) {
    return null;
  } else {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}

int getTimestampFromDateTime(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch;
}

String getUniqueDeviceId() {
  final random = Random();
  const String characters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#%&'()*+,-./:;<=>?@[]^_`{|}~";

  String deviceId = '';

  for (int i = 0; i < 12; i++) {
    final randomIndex = random.nextInt(characters.length);
    deviceId += characters[randomIndex];
  }

  return deviceId;
}

String getUniqueTaskId(
    {required String text,
    required TaskPriority importance,
    required int createdAt}) {
  Random random = Random();
  int randomNum = random.nextInt(100);
  final mixedString = '$randomNum$text${importance.toString()}$createdAt';
  final taskId = mixedString.hashCode.toUnsigned(32).toRadixString(16);

  return taskId;
}

Map<TaskPriority, String> priorityTitles = {
  TaskPriority.basic: 'Нет',
  TaskPriority.low: 'Низкий',
  TaskPriority.important: '!! Высокий',
};

String formatSelectedDate(int selectedDateTimestamp) {
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(selectedDateTimestamp);
  return DateFormat('dd MMMM yyyy', 'ru_RU').format(dateTime);
}

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
