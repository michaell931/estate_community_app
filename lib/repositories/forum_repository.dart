import 'package:estate_community_app/data_sources/forum_data_source.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForumRepository {
  ForumRepository({required this.forumDataSource});
  final ForumDataSource forumDataSource;

  Stream<List<ForumModel>> getItemsStream() {
    return forumDataSource.getItemsStream();
  }

  Future<ForumModel> get({required String id}) async {
    return forumDataSource.get(id: id);
  }
}
