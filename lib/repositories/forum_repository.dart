import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate_community_app/models/forum_model.dart';

class ForumRepository {
  Stream<List<ForumModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('forum')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ForumModel(
              content: doc['content'], theme: doc['theme'], id: doc.id);
        },
      ).toList();
    });
  }

  Future<ForumModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('forum').doc(id).get();
    return ForumModel(theme: doc['theme'], content: doc['content'], id: doc.id);
  }
}
