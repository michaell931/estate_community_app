import 'package:estate_community_app/app/features/news/cubit/news_cubit.dart';
import 'package:estate_community_app/app/features/news_details/pages/news_details_page.dart';
import 'package:estate_community_app/app/injection_container.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => getIt()..start(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          final newsModels = state.documents;
          if (newsModels.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              final newsModels = state.documents;
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView(
                children: [
                  for (final newsModel in newsModels) ...[
                    NewsWidget(
                      newsModel: newsModel,
                    ),
                  ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(id: newsModel.id),
          ),
        );
      },
      child: Container(
        color: const Color.fromARGB(255, 44, 44, 44),
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 120,
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
