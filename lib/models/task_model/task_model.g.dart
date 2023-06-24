// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: $enumDecode(_$TaskPriorityEnumMap, json['importance']),
      deadline: json['deadline'] as int?,
      done: json['done'] as bool,
      color: json['color'] as String?,
      created_at: json['created_at'] as int,
      changed_at: json['changed_at'] as int,
      last_updated_by: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$TaskPriorityEnumMap[instance.importance]!,
      'deadline': instance.deadline,
      'done': instance.done,
      'color': instance.color,
      'created_at': instance.created_at,
      'changed_at': instance.changed_at,
      'last_updated_by': instance.last_updated_by,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.basic: 'basic',
  TaskPriority.low: 'low',
  TaskPriority.important: 'important',
};
