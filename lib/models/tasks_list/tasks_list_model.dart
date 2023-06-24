import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoist/models/task_model/task_model.dart';

part 'tasks_list_model.freezed.dart';
part 'tasks_list_model.g.dart';

@freezed
class TasksListModel with _$TasksListModel {
  const factory TasksListModel({
    required String status,
    required List<TaskModel> list,
    required int revision,
  }) = _TasksListModel;

  factory TasksListModel.fromJson(Map<String, dynamic> json) =>
      _$TasksListModelFromJson(json);
}