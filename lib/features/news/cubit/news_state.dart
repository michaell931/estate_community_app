part of 'news_cubit.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required final List<NewsModel> documents,
    required final bool isLoading,
    required final String errorMessage,
  }) = _NewsState;
}
