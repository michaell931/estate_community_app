part of 'forum_cubit.dart';

@immutable
class ForumState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const ForumState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
