part of 'news_cubit.dart';

@immutable
class NewsState {
  final List<NewsModel> documents;
  final bool isLoading;
  final String errorMessage;

  const NewsState(
      {this.documents = const [],
      required this.isLoading,
      required this.errorMessage});
}
