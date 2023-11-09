import 'package:bloc_test/bloc_test.dart';
import 'package:estate_community_app/features/forum_details/cubit/forum_details_cubit.dart';
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

  group('start', () {
    blocTest<ForumDetailsCubit, ForumDetailsState>(
      'emits loading then documents when success',
      build: () {
        when(() => mockForumRepository.get(id: 'id1'))
            .thenAnswer((_) => Future.value(
                  ForumModel(theme: 'theme1', content: 'content1', id: 'id1'),
                ));
        return ForumDetailsCubit(forumRepository: mockForumRepository);
      },
      act: (cubit) => cubit.getPostWithID('id1'),
      expect: () => [
        ForumDetailsState(
            forumModel:
                ForumModel(theme: 'theme1', content: 'content1', id: 'id1'),
            errorMessage: ''),
      ],
    );
    blocTest<ForumDetailsCubit, ForumDetailsState>(
      'emits loading then error',
      build: () {
        when(() => mockForumRepository.get(id: 'id1'))
            .thenAnswer((_) => Future.error('error-message'));
        return ForumDetailsCubit(forumRepository: mockForumRepository);
      },
      act: (cubit) => cubit.getPostWithID('id1'),
      expect: () => [
        const ForumDetailsState(
            forumModel: null, errorMessage: 'error-message'),
      ],
    );
  });
}
