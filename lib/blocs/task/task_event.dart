part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTask extends TaskEvent {
  final TaskModel task;

  const CreateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ReadTask extends TaskEvent {
  final List<TaskModel> tasks;

  const ReadTask({this.tasks = const <TaskModel>[]});

  @override
  List<Object> get props => [tasks];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final TaskModel task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}
