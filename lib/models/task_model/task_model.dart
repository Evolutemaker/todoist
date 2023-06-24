import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoist/constants/enums.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String text,
    required TaskPriority importance,
    required int? deadline,
    required bool done,
    required String? color,
    // ignore: non_constant_identifier_names
    required int created_at,
    // ignore: non_constant_identifier_names
    required int changed_at,
    // ignore: non_constant_identifier_names
    required String last_updated_by,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}