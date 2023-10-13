// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrashCalendarModel {
  String get eventName => throw _privateConstructorUsedError;
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  Color get background => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrashCalendarModelCopyWith<TrashCalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrashCalendarModelCopyWith<$Res> {
  factory $TrashCalendarModelCopyWith(
          TrashCalendarModel value, $Res Function(TrashCalendarModel) then) =
      _$TrashCalendarModelCopyWithImpl<$Res, TrashCalendarModel>;
  @useResult
  $Res call(
      {String eventName,
      DateTime from,
      DateTime to,
      Color background,
      bool isAllDay});
}

/// @nodoc
class _$TrashCalendarModelCopyWithImpl<$Res, $Val extends TrashCalendarModel>
    implements $TrashCalendarModelCopyWith<$Res> {
  _$TrashCalendarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? from = null,
    Object? to = null,
    Object? background = null,
    Object? isAllDay = null,
  }) {
    return _then(_value.copyWith(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrashCalendarModelImplCopyWith<$Res>
    implements $TrashCalendarModelCopyWith<$Res> {
  factory _$$TrashCalendarModelImplCopyWith(_$TrashCalendarModelImpl value,
          $Res Function(_$TrashCalendarModelImpl) then) =
      __$$TrashCalendarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventName,
      DateTime from,
      DateTime to,
      Color background,
      bool isAllDay});
}

/// @nodoc
class __$$TrashCalendarModelImplCopyWithImpl<$Res>
    extends _$TrashCalendarModelCopyWithImpl<$Res, _$TrashCalendarModelImpl>
    implements _$$TrashCalendarModelImplCopyWith<$Res> {
  __$$TrashCalendarModelImplCopyWithImpl(_$TrashCalendarModelImpl _value,
      $Res Function(_$TrashCalendarModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? from = null,
    Object? to = null,
    Object? background = null,
    Object? isAllDay = null,
  }) {
    return _then(_$TrashCalendarModelImpl(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TrashCalendarModelImpl implements _TrashCalendarModel {
  _$TrashCalendarModelImpl(
      {required this.eventName,
      required this.from,
      required this.to,
      required this.background,
      required this.isAllDay});

  @override
  final String eventName;
  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final Color background;
  @override
  final bool isAllDay;

  @override
  String toString() {
    return 'TrashCalendarModel(eventName: $eventName, from: $from, to: $to, background: $background, isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrashCalendarModelImpl &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventName, from, to, background, isAllDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrashCalendarModelImplCopyWith<_$TrashCalendarModelImpl> get copyWith =>
      __$$TrashCalendarModelImplCopyWithImpl<_$TrashCalendarModelImpl>(
          this, _$identity);
}

abstract class _TrashCalendarModel implements TrashCalendarModel {
  factory _TrashCalendarModel(
      {required final String eventName,
      required final DateTime from,
      required final DateTime to,
      required final Color background,
      required final bool isAllDay}) = _$TrashCalendarModelImpl;

  @override
  String get eventName;
  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  Color get background;
  @override
  bool get isAllDay;
  @override
  @JsonKey(ignore: true)
  _$$TrashCalendarModelImplCopyWith<_$TrashCalendarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
