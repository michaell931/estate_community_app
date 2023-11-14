import 'package:estate_community_app/data_sources/forum_data_source.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockForumDataSource extends Mock implements ForumDataSource {}

void main() {
  late ForumRepository sut;
  late MockForumDataSource dataSource;

  setUp(() {
    dataSource = MockForumDataSource();
    sut = ForumRepository(forumDataSource: dataSource);
  });

  group('ForumRepository', () {
    group('get()', () {
      test('returns ForumModel when success', () async {
        when(() => dataSource.get(id: 'id')).thenAnswer(
          (_) => Future.value(
            ForumModel(theme: 'theme-1', content: 'content-1', id: 'id-1'),
          ),
        );

        final result = await sut.get(id: 'id');

        expect(
          result,
          equals(
            ForumModel(theme: 'theme-1', content: 'content-1', id: 'id-1'),
          ),
        );
      });
    });
    group('start', () {
      test('emits loading then items when success', () {
        when(() => dataSource.getItemsStream()).thenAnswer(
          (_) => Stream.value([
            ForumModel(theme: 'theme-1', content: 'content-1', id: 'id-1'),
          ]),
        );

        final results = sut.getItemsStream();

        expect(
            results,
            emits([
              ForumModel(theme: 'theme-1', content: 'content-1', id: 'id-1')
            ]));
      });
      test('emits loading then errorMessage when failed', () {
        when(() => dataSource.getItemsStream())
            .thenAnswer((_) => Stream.error('error-message'));
        sut.getItemsStream();
        final results = sut.getItemsStream();
        expect(
          results,
          emitsError('error-message'),
        );
      });
    });
  });
}
