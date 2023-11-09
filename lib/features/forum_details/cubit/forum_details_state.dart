part of 'forum_details_cubit.dart';

@freezed
class ForumDetailsState with _$ForumDetailsState {
  const factory ForumDetailsState({
    required final ForumModel? forumModel,
    required final String? errorMessage,
  }) = _ForumDetailsState;
}
