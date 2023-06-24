// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_element_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskElementModel _$TaskElementModelFromJson(Map<String, dynamic> json) {
  return _TaskElementModel.fromJson(json);
}

/// @nodoc
mixin _$TaskElementModel {
  String get status => throw _privateConstructorUsedError;
  TaskModel get element => throw _privateConstructorUsedError;
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskElementModelCopyWith<TaskElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskElementModelCopyWith<$Res> {
  factory $TaskElementModelCopyWith(
          TaskElementModel value, $Res Function(TaskElementModel) then) =
      _$TaskElementModelCopyWithImpl<$Res, TaskElementModel>;
  @useResult
  $Res call({String status, TaskModel element, int revision});

  $TaskModelCopyWith<$Res> get element;
}

/// @nodoc
class _$TaskElementModelCopyWithImpl<$Res, $Val extends TaskElementModel>
    implements $TaskElementModelCopyWith<$Res> {
  _$TaskElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get element {
    return $TaskModelCopyWith<$Res>(_value.element, (value) {
      return _then(_value.copyWith(element: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskElementModelCopyWith<$Res>
    implements $TaskElementModelCopyWith<$Res> {
  factory _$$_TaskElementModelCopyWith(
          _$_TaskElementModel value, $Res Function(_$_TaskElementModel) then) =
      __$$_TaskElementModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, TaskModel element, int revision});

  @override
  $TaskModelCopyWith<$Res> get element;
}

/// @nodoc
class __$$_TaskElementModelCopyWithImpl<$Res>
    extends _$TaskElementModelCopyWithImpl<$Res, _$_TaskElementModel>
    implements _$$_TaskElementModelCopyWith<$Res> {
  __$$_TaskElementModelCopyWithImpl(
      _$_TaskElementModel _value, $Res Function(_$_TaskElementModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_$_TaskElementModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskElementModel implements _TaskElementModel {
  const _$_TaskElementModel(
      {required this.status, required this.element, required this.revision});

  factory _$_TaskElementModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskElementModelFromJson(json);

  @override
  final String status;
  @override
  final TaskModel element;
  @override
  final int revision;

  @override
  String toString() {
    return 'TaskElementModel(status: $status, element: $element, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskElementModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, element, revision);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskElementModelCopyWith<_$_TaskElementModel> get copyWith =>
      __$$_TaskElementModelCopyWithImpl<_$_TaskElementModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskElementModelToJson(
      this,
    );
  }
}

abstract class _TaskElementModel implements TaskElementModel {
  const factory _TaskElementModel(
      {required final String status,
      required final TaskModel element,
      required final int revision}) = _$_TaskElementModel;

  factory _TaskElementModel.fromJson(Map<String, dynamic> json) =
      _$_TaskElementModel.fromJson;

  @override
  String get status;
  @override
  TaskModel get element;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TaskElementModelCopyWith<_$_TaskElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}
