import 'package:equatable/equatable.dart';
import 'package:todoist/constants/enums.dart';
class TaskModel extends Equatable {
  final String text;

  final TaskPriority priority;

  bool? isCompleted;

  DateTime? date;

  TaskModel({
    required this.text,
    this.priority = TaskPriority.no,
    this.date,
    this.isCompleted,
  }) {
    isCompleted = isCompleted ?? false;
    date = date ?? DateTime.now();
  }

  TaskModel copyWith({
    String? id,
    String? text,
    TaskPriority? priority,
    bool? isCompleted,
    DateTime? date,
  }) {
    return TaskModel(
      text: text ?? this.text,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        text,
        priority,
        isCompleted,
        date,
      ];

  static List<TaskModel> tasks = [
    TaskModel(
      text: 'text',
      priority: TaskPriority.no,
      date: DateTime.now(),
    ),
  ];
}
