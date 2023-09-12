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

          final docs = state.documents;

          return ListView(
            children: [
              for (final doc in docs) ...[
                NewsWidget(
                  doc.title,
                  imageUrl: doc.imageUrl,
                ),
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
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 44, 44, 44),
      // padding: const EdgeInsets.all(40),
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
                  image: NetworkImage(imageUrl), fit: BoxFit.fitHeight),
            ),
            child: const SizedBox.shrink(),
          ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
