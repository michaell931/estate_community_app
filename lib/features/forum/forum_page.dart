import 'package:estate_community_app/features/forum/cubit/forum_cubit.dart';
import 'package:estate_community_app/features/forum_details/pages/forum_details_page.dart';
import 'package:estate_community_app/app/injection_container.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForumCubit>(
      create: (context) => getIt()..start(),
      child: BlocBuilder<ForumCubit, ForumState>(
        builder: (context, state) {
          final forumModels = state.documents;
          if (forumModels.isEmpty) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              for (final forumModel in forumModels) ...[
                Dismissible(
                  key: ValueKey(forumModel.id),
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
                  onDismissed: (direction) {
                    context
                        .read<ForumCubit>()
                        .deleteDocument(id: forumModel.id);
                  },
                  child: PostWidget(
                    forumModel: forumModel,
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
  const PostWidget({
    Key? key,
    required this.forumModel,
  }) : super(key: key);

  final ForumModel forumModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForumDetailsPage(id: forumModel.id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 44, 44, 44)),
          height: 150,
          width: 370,
          child: Center(
            child: Text(
              forumModel.theme,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}