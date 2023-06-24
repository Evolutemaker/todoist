import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime? _selectedDate;

  final int _taskCreationTime = DateTime.now().millisecondsSinceEpoch;

  int _taskChangedTime = DateTime.now().millisecondsSinceEpoch;

  DateTime? get selectedDate => _selectedDate;

  int get taskCreationTime => _taskCreationTime;

  int get taskChangedTime => _taskChangedTime;

  set setDate(DateTime? chosenDate) {
    _selectedDate = chosenDate;
    notifyListeners();
  }

  set setNewTaskChangedTime(DateTime dateTime) {
    _taskChangedTime = dateTime.millisecondsSinceEpoch;
    notifyListeners();
  }
}
