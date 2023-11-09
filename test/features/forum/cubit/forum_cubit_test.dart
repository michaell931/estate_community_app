import 'package:bloc_test/bloc_test.dart';
import 'package:estate_community_app/features/forum/cubit/forum_cubit.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockForumRepository extends Mock implements ForumRepository {}

void main() {
  late MockForumRepository mockForumRepository;

  setUp(() {
    mockForumRepository = MockForumRepository();
  });

  group(
    'start',
    () {
      blocTest<ForumCubit, ForumState>(
        'emits loading then documents when success',
        build: () {
          when(mockForumRepository.getItemsStream).thenAnswer(
            (_) => Stream.value([
              ForumModel(theme: 'theme1', content: 'content1', id: 'id1'),
            ]),
          );
          return ForumCubit(forumRepository: mockForumRepository);
        },
        act: (cubit) => cubit.start(),
        expect: () => [
          const ForumState(
            documents: [],
            isLoading: true,
            errorMessage: '',
          ),
          ForumState(
            documents: [
              ForumModel(theme: 'theme1', content: 'content1', id: 'id1'),
            ],
            isLoading: false,
            errorMessage: '',
          ),
        ],
      );
      blocTest<ForumCubit, ForumState>(
        'emits loading then errorMessage when failed',
        build: () {
          when(mockForumRepository.getItemsStream).thenAnswer(
            (_) => Stream.error('error-message'),
          );

          return ForumCubit(forumRepository: mockForumRepository);
        },
        act: (cubit) => cubit.start(),
        expect: () => [
          const ForumState(documents: [], isLoading: true, errorMessage: ''),
          const ForumState(
              documents: [], isLoading: false, errorMessage: 'error-message'),
        ],
      );
    },
  );
}
