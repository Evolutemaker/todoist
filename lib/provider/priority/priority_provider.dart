import 'package:flutter/material.dart';
import 'package:todoist/constants/enums.dart';

class PriorityProvider extends ChangeNotifier {
  TaskPriority _taskPriority = TaskPriority.basic;

  TaskPriority get taskPriority => _taskPriority;

  set setTaskPriority(TaskPriority chosenPriority) {
    _taskPriority = chosenPriority;
    notifyListeners();
  }
}
