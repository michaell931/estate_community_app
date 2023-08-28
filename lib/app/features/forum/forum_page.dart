import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('forum').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Proszę czekać, trwa ładowanie');
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('forum')
                        .doc(document.id)
                        .delete();
                  },
                  child: PostWidget(
                    document['theme'],
                  ),
                ),
              ],
            ],
          );
        });
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.limeAccent,
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(20),
      child: Text(title),
    );
  }
}
