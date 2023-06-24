// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskElementModel _$$_TaskElementModelFromJson(Map<String, dynamic> json) =>
    _$_TaskElementModel(
      status: json['status'] as String,
      element: TaskModel.fromJson(json['element'] as Map<String, dynamic>),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$$_TaskElementModelToJson(_$_TaskElementModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'element': instance.element,
      'revision': instance.revision,
    };
