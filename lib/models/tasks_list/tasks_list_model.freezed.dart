// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksListModel _$TasksListModelFromJson(Map<String, dynamic> json) {
  return _TasksListModel.fromJson(json);
}

/// @nodoc
mixin _$TasksListModel {
  String get status => throw _privateConstructorUsedError;
  List<TaskModel> get list => throw _privateConstructorUsedError;
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksListModelCopyWith<TasksListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksListModelCopyWith<$Res> {
  factory $TasksListModelCopyWith(
          TasksListModel value, $Res Function(TasksListModel) then) =
      _$TasksListModelCopyWithImpl<$Res, TasksListModel>;
  @useResult
  $Res call({String status, List<TaskModel> list, int revision});
}

/// @nodoc
class _$TasksListModelCopyWithImpl<$Res, $Val extends TasksListModel>
    implements $TasksListModelCopyWith<$Res> {
  _$TasksListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? list = null,
    Object? revision = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TasksListModelCopyWith<$Res>
    implements $TasksListModelCopyWith<$Res> {
  factory _$$_TasksListModelCopyWith(
          _$_TasksListModel value, $Res Function(_$_TasksListModel) then) =
      __$$_TasksListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<TaskModel> list, int revision});
}

/// @nodoc
class __$$_TasksListModelCopyWithImpl<$Res>
    extends _$TasksListModelCopyWithImpl<$Res, _$_TasksListModel>
    implements _$$_TasksListModelCopyWith<$Res> {
  __$$_TasksListModelCopyWithImpl(
      _$_TasksListModel _value, $Res Function(_$_TasksListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? list = null,
    Object? revision = null,
  }) {
    return _then(_$_TasksListModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TasksListModel implements _TasksListModel {
  const _$_TasksListModel(
      {required this.status,
      required final List<TaskModel> list,
      required this.revision})
      : _list = list;

  factory _$_TasksListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TasksListModelFromJson(json);

  @override
  final String status;
  final List<TaskModel> _list;
  @override
  List<TaskModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int revision;

  @override
  String toString() {
    return 'TasksListModel(status: $status, list: $list, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksListModel &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_list), revision);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TasksListModelCopyWith<_$_TasksListModel> get copyWith =>
      __$$_TasksListModelCopyWithImpl<_$_TasksListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksListModelToJson(
      this,
    );
  }
}

abstract class _TasksListModel implements TasksListModel {
  const factory _TasksListModel(
      {required final String status,
      required final List<TaskModel> list,
      required final int revision}) = _$_TasksListModel;

  factory _TasksListModel.fromJson(Map<String, dynamic> json) =
      _$_TasksListModel.fromJson;

  @override
  String get status;
  @override
  List<TaskModel> get list;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TasksListModelCopyWith<_$_TasksListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
