// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumState {
  List<ForumModel> get documents => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumStateCopyWith<ForumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumStateCopyWith<$Res> {
  factory $ForumStateCopyWith(
          ForumState value, $Res Function(ForumState) then) =
      _$ForumStateCopyWithImpl<$Res, ForumState>;
  @useResult
  $Res call({List<ForumModel> documents, bool isLoading, String errorMessage});
}

/// @nodoc
class _$ForumStateCopyWithImpl<$Res, $Val extends ForumState>
    implements $ForumStateCopyWith<$Res> {
  _$ForumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumStateImplCopyWith<$Res>
    implements $ForumStateCopyWith<$Res> {
  factory _$$ForumStateImplCopyWith(
          _$ForumStateImpl value, $Res Function(_$ForumStateImpl) then) =
      __$$ForumStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForumModel> documents, bool isLoading, String errorMessage});
}

/// @nodoc
class __$$ForumStateImplCopyWithImpl<$Res>
    extends _$ForumStateCopyWithImpl<$Res, _$ForumStateImpl>
    implements _$$ForumStateImplCopyWith<$Res> {
  __$$ForumStateImplCopyWithImpl(
      _$ForumStateImpl _value, $Res Function(_$ForumStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ForumStateImpl(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForumStateImpl implements _ForumState {
  const _$ForumStateImpl(
      {required final List<ForumModel> documents,
      required this.isLoading,
      required this.errorMessage})
      : _documents = documents;

  final List<ForumModel> _documents;
  @override
  List<ForumModel> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ForumState(documents: $documents, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumStateImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumStateImplCopyWith<_$ForumStateImpl> get copyWith =>
      __$$ForumStateImplCopyWithImpl<_$ForumStateImpl>(this, _$identity);
}

abstract class _ForumState implements ForumState {
  const factory _ForumState(
      {required final List<ForumModel> documents,
      required final bool isLoading,
      required final String errorMessage}) = _$ForumStateImpl;

  @override
  List<ForumModel> get documents;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ForumStateImplCopyWith<_$ForumStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
