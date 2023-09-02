import 'package:estate_community_app/app/features/forum/cubit/forum_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForumCubit()..start(),
      child: BlocBuilder<ForumCubit, ForumState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    context.read<ForumCubit>().deleteDocument(id: document.id);
                  },
                  child: PostWidget(
                    document['theme'],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
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
