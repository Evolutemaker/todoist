import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/models/task/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  void _onCreateTask(CreateTask event, Emitter<TaskState> emit) {
    final state = this.state;

    if (state is TaskLoaded) {
      emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
    }
  }

  void _onReadTask(ReadTask event, Emitter<TaskState> emit) {
    emit(TaskLoaded(tasks: event.tasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {}

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {}

  TaskBloc() : super(TaskLoading()) {
    on<TaskEvent>((event, emit) {
      on<CreateTask>(_onCreateTask);
      on<ReadTask>(_onReadTask);
      on<UpdateTask>(_onUpdateTask);
      on<DeleteTask>(_onDeleteTask);
    });
  }
}
