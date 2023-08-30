part of 'news_cubit.dart';

@immutable
class NewsState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const NewsState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
