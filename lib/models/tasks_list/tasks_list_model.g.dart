// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TasksListModel _$$_TasksListModelFromJson(Map<String, dynamic> json) =>
    _$_TasksListModel(
      status: json['status'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$$_TasksListModelToJson(_$_TasksListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.list,
      'revision': instance.revision,
    };
