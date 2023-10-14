import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';

part 'news_details_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit(this._newsRepository)
      : super(NewsDetailsState(newsModel: null));

  final NewsRepository _newsRepository;

  Future<void> getNewsWithID(String id) async {
    final newsModel = await _newsRepository.get(id: id);
    emit(NewsDetailsState(newsModel: newsModel));
  }
}
