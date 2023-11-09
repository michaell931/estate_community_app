// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumDetailsState {
  ForumModel? get forumModel => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumDetailsStateCopyWith<ForumDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumDetailsStateCopyWith<$Res> {
  factory $ForumDetailsStateCopyWith(
          ForumDetailsState value, $Res Function(ForumDetailsState) then) =
      _$ForumDetailsStateCopyWithImpl<$Res, ForumDetailsState>;
  @useResult
  $Res call({ForumModel? forumModel, String? errorMessage});

  $ForumModelCopyWith<$Res>? get forumModel;
}

/// @nodoc
class _$ForumDetailsStateCopyWithImpl<$Res, $Val extends ForumDetailsState>
    implements $ForumDetailsStateCopyWith<$Res> {
  _$ForumDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forumModel = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      forumModel: freezed == forumModel
          ? _value.forumModel
          : forumModel // ignore: cast_nullable_to_non_nullable
              as ForumModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ForumModelCopyWith<$Res>? get forumModel {
    if (_value.forumModel == null) {
      return null;
    }

    return $ForumModelCopyWith<$Res>(_value.forumModel!, (value) {
      return _then(_value.copyWith(forumModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForumDetailsStateImplCopyWith<$Res>
    implements $ForumDetailsStateCopyWith<$Res> {
  factory _$$ForumDetailsStateImplCopyWith(_$ForumDetailsStateImpl value,
          $Res Function(_$ForumDetailsStateImpl) then) =
      __$$ForumDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ForumModel? forumModel, String? errorMessage});

  @override
  $ForumModelCopyWith<$Res>? get forumModel;
}

/// @nodoc
class __$$ForumDetailsStateImplCopyWithImpl<$Res>
    extends _$ForumDetailsStateCopyWithImpl<$Res, _$ForumDetailsStateImpl>
    implements _$$ForumDetailsStateImplCopyWith<$Res> {
  __$$ForumDetailsStateImplCopyWithImpl(_$ForumDetailsStateImpl _value,
      $Res Function(_$ForumDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forumModel = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ForumDetailsStateImpl(
      forumModel: freezed == forumModel
          ? _value.forumModel
          : forumModel // ignore: cast_nullable_to_non_nullable
              as ForumModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ForumDetailsStateImpl implements _ForumDetailsState {
  const _$ForumDetailsStateImpl(
      {required this.forumModel, required this.errorMessage});

  @override
  final ForumModel? forumModel;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ForumDetailsState(forumModel: $forumModel, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumDetailsStateImpl &&
            (identical(other.forumModel, forumModel) ||
                other.forumModel == forumModel) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forumModel, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumDetailsStateImplCopyWith<_$ForumDetailsStateImpl> get copyWith =>
      __$$ForumDetailsStateImplCopyWithImpl<_$ForumDetailsStateImpl>(
          this, _$identity);
}

abstract class _ForumDetailsState implements ForumDetailsState {
  const factory _ForumDetailsState(
      {required final ForumModel? forumModel,
      required final String? errorMessage}) = _$ForumDetailsStateImpl;

  @override
  ForumModel? get forumModel;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ForumDetailsStateImplCopyWith<_$ForumDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
