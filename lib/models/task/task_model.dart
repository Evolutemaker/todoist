import 'package:todoist/constants/enums.dart';

class TaskModel {
  int id;

  String text;

  TaskPriority priority;

  bool isCompleted;

  // добавить дату как String или DateFormat

  TaskModel({
    required this.id,
    required this.text,
    required this.priority,
    required this.isCompleted,
  });
}
