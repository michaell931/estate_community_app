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
                  background: const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return direction == DismissDirection.endToStart;
                  },
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 44, 44, 44)),
        height: 150,
        width: 370,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
