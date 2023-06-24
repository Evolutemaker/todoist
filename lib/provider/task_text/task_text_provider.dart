import 'package:flutter/material.dart';

class TaskTextProvider extends ChangeNotifier {
  String _taskText= '';

  String get taskText => _taskText;

  set setTaskText(value) {
    _taskText = value;
    notifyListeners();
  }
}
