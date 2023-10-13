// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumModel {
  String get theme => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumModelCopyWith<ForumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumModelCopyWith<$Res> {
  factory $ForumModelCopyWith(
          ForumModel value, $Res Function(ForumModel) then) =
      _$ForumModelCopyWithImpl<$Res, ForumModel>;
  @useResult
  $Res call({String theme, String content, String id});
}

/// @nodoc
class _$ForumModelCopyWithImpl<$Res, $Val extends ForumModel>
    implements $ForumModelCopyWith<$Res> {
  _$ForumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? content = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumModelImplCopyWith<$Res>
    implements $ForumModelCopyWith<$Res> {
  factory _$$ForumModelImplCopyWith(
          _$ForumModelImpl value, $Res Function(_$ForumModelImpl) then) =
      __$$ForumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String theme, String content, String id});
}

/// @nodoc
class __$$ForumModelImplCopyWithImpl<$Res>
    extends _$ForumModelCopyWithImpl<$Res, _$ForumModelImpl>
    implements _$$ForumModelImplCopyWith<$Res> {
  __$$ForumModelImplCopyWithImpl(
      _$ForumModelImpl _value, $Res Function(_$ForumModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? content = null,
    Object? id = null,
  }) {
    return _then(_$ForumModelImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForumModelImpl implements _ForumModel {
  _$ForumModelImpl(
      {required this.theme, required this.content, required this.id});

  @override
  final String theme;
  @override
  final String content;
  @override
  final String id;

  @override
  String toString() {
    return 'ForumModel(theme: $theme, content: $content, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumModelImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, content, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumModelImplCopyWith<_$ForumModelImpl> get copyWith =>
      __$$ForumModelImplCopyWithImpl<_$ForumModelImpl>(this, _$identity);
}

abstract class _ForumModel implements ForumModel {
  factory _ForumModel(
      {required final String theme,
      required final String content,
      required final String id}) = _$ForumModelImpl;

  @override
  String get theme;
  @override
  String get content;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ForumModelImplCopyWith<_$ForumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
