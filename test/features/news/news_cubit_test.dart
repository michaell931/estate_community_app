import 'package:bloc_test/bloc_test.dart';
import 'package:estate_community_app/features/news/cubit/news_cubit.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
  });

  group(
    'start',
    () {
      blocTest<NewsCubit, NewsState>(
        'emits loading then documents when success',
        build: () {
          when(mockNewsRepository.getItemsStream).thenAnswer(
            (_) => Stream.value([
              NewsModel(
                  content: 'content1',
                  id: 'id1',
                  title: 'title1',
                  imageUrl: 'imageUrl1'),
            ]),
          );
          return NewsCubit(newsRepository: mockNewsRepository);
        },
        act: (cubit) => cubit.start(),
        expect: () => [
          const NewsState(documents: [], isLoading: true, errorMessage: ''),
          NewsState(documents: [
            NewsModel(
                content: 'content1',
                id: 'id1',
                title: 'title1',
                imageUrl: 'imageUrl1')
          ], isLoading: false, errorMessage: ''),
        ],
      );
      blocTest<NewsCubit, NewsState>(
        'emits loading then errorMessage when failed',
        build: () {
          when(mockNewsRepository.getItemsStream).thenAnswer(
            (_) => Stream.error('error-message'),
          );

          return NewsCubit(newsRepository: mockNewsRepository);
        },
        act: (cubit) => cubit.start(),
        expect: () => [
          const NewsState(documents: [], isLoading: true, errorMessage: ''),
          const NewsState(
              documents: [], isLoading: false, errorMessage: 'error-message'),
        ],
      );
    },
  );
}
