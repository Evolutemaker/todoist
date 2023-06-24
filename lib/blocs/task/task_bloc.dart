// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todoist/models/task/todo_model.dart';

// part 'task_event.dart';
// part 'task_state.dart';

// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   TaskBloc() : super(TaskLoading()) {
//     on<CreateTask>(_onCreateTask);
//     on<ReadTask>(_onReadTask);
//     on<UpdateTask>(_onUpdateTask);
//     on<DeleteTask>(_onDeleteTask);
//   }

//   void _onCreateTask(CreateTask event, Emitter<TaskState> emit) {
//     final state = this.state;

//     if (state is TaskLoaded) {
//       emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
//     }
//   }

//   void _onReadTask(ReadTask event, Emitter<TaskState> emit) {
//     emit(TaskLoaded(tasks: event.tasks));
//   }

//   void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
//     final state = this.state;

//     if (state is TaskLoaded) {
//       List<TodoModel> tasks = (state.tasks.map((task) {
//         return task.id == event.task.id ? event.task : task;
//       })).toList();

//       emit(TaskLoaded(tasks: tasks));
//     }
//   }

//   void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
//     final state = this.state;

//     if (state is TaskLoaded) {
//       List<TodoModel> tasks = (state.tasks.where((task) {
//         return task.id != event.task.id;
//       })).toList();

//       emit(TaskLoaded(tasks: tasks));
//     }
//   }
// }
