part of 'forum_cubit.dart';

@immutable
class ForumState {
  final List<ForumModel> documents;
  final bool isLoading;
  final String errorMessage;

  const ForumState(
      {this.documents = const [],
      required this.isLoading,
      required this.errorMessage});
}
