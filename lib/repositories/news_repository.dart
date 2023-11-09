import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsRepository {
  Stream<List<NewsModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('news')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return NewsModel(
            id: doc.id,
            title: doc['title'],
            imageUrl: doc['image_url'],
            content: doc['content'],
          );
        },
      ).toList();
    });
  }

  Future<NewsModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('news').doc(id).get();
    return NewsModel(
      title: doc['title'],
      imageUrl: doc['image_url'],
      id: doc['id'],
      content: doc['content'],
    );
  }
}
