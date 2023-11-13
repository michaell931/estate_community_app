import 'package:estate_community_app/data_sources/forum_data_source.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForumRepository {
  ForumRepository(this._forumDataSource);
  final ForumDataSource _forumDataSource;

  Stream<List<ForumModel>> getItemsStream() {
    return _forumDataSource.getItemsStream();
  }

  Future<ForumModel> get({required String id}) async {
    return _forumDataSource.get(id: id);
  }
}
