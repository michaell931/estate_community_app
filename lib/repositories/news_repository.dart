import 'package:estate_community_app/data_sources/news_data_source.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsRepository {
  NewsRepository(this._newsDataSource);
  final NewsDataSource _newsDataSource;

  Stream<List<NewsModel>> getItemsStream() {
    return _newsDataSource.getItemsStream();
  }

  Future<NewsModel> get({required String id}) async {
    return _newsDataSource.get(id: id);
  }
}
