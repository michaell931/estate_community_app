import 'package:estate_community_app/app/features/news_details/cubit/news_details_cubit.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsDetailsCubit(NewsRepository())..getNewsWithID(id),
      child: BlocBuilder<NewsDetailsCubit, NewsDetailsState>(
        builder: (context, state) {
          final newsModels = state.newsModel;
          if (newsModels == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [NewsDetailsWidget(newsModel: newsModels)],
          );
        },
      ),
    );
  }
}

class NewsDetailsWidget extends StatelessWidget {
  const NewsDetailsWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color.fromARGB(255, 44, 44, 44),
        // padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(20),

        child: Row(
          children: [
            Container(
              height: 720,
              width: 120,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(newsModel.imageUrl),
                    fit: BoxFit.fitHeight),
              ),
              child: const SizedBox.shrink(),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: Text(
                newsModel.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
