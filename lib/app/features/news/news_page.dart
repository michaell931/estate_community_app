import 'package:estate_community_app/app/features/news/cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..start(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                NewsWidget(document['title']),
              ],
            ],
          );
        },
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 93, 81, 81),
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(20),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
