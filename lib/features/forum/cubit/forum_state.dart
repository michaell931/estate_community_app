part of 'forum_cubit.dart';

@freezed
class ForumState with _$ForumState {
  const factory ForumState({
    required final List<ForumModel> documents,
    required final bool isLoading,
    required final String errorMessage,
  }) = _ForumState;
}
