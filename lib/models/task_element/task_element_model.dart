import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoist/models/task_model/task_model.dart';

part 'task_element_model.freezed.dart';
part 'task_element_model.g.dart';

@freezed
class TaskElementModel with _$TaskElementModel {
  const factory TaskElementModel({
    required String status,
    required TaskModel element,
    required int revision,
  }) = _TaskElementModel;

  factory TaskElementModel.fromJson(Map<String, dynamic> json) =>
      _$TaskElementModelFromJson(json);
}