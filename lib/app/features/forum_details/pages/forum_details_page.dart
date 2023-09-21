import 'package:estate_community_app/app/features/forum_details/cubit/forum_details_cubit.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForumDetailsPage extends StatelessWidget {
  const ForumDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForumDetailsCubit(ForumRepository())..getPostWithID(id),
      child: BlocBuilder<ForumDetailsCubit, ForumDetailsState>(
        builder: (context, state) {
          final forumModels = state.forumModel;
          if (forumModels == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [ForumDetailsWidget(forumModel: forumModels)],
          );
        },
      ),
    );
  }
}

class ForumDetailsWidget extends StatelessWidget {
  const ForumDetailsWidget({
    Key? key,
    required this.forumModel,
  }) : super(key: key);

  final ForumModel forumModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color.fromARGB(255, 44, 44, 44),
        child: Row(
          children: [
            Container(
              height: 720,
              width: 120,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/bloki_dev.jpg')),
              ),
              child: const SizedBox.shrink(),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(forumModel.theme),
            Expanded(
              child: Text(
                forumModel.content,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
