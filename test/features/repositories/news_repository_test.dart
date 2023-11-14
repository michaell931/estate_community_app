import 'package:estate_community_app/data_sources/news_data_source.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsDataSource extends Mock implements NewsDataSource {}

void main() {
  late NewsRepository sut;
  late MockNewsDataSource dataSource;

  setUp(() {
    dataSource = MockNewsDataSource();
    sut = NewsRepository(newsDataSource: dataSource);
  });

  group('NewsRepository', () {
    group('get()', () {
      test('returns NewsModel when success', () async {
        when(() => dataSource.get(id: 'id')).thenAnswer(
          (_) => Future.value(
            NewsModel(
                content: 'content-1',
                id: 'id-1',
                title: 'title-1',
                imageUrl: 'imageUrl-1'),
          ),
        );

        final result = await sut.get(id: 'id');

        expect(
          result,
          equals(
            NewsModel(
                content: 'content-1',
                id: 'id-1',
                title: 'title-1',
                imageUrl: 'imageUrl-1'),
          ),
        );
      });
    });
    group('start', () {
      test('emits loading then items when success', () {
        when(() => dataSource.getItemsStream()).thenAnswer(
          (_) => Stream.value([
            NewsModel(
                content: 'content-1',
                id: 'id-1',
                title: 'title-1',
                imageUrl: 'imageUrl-1'),
          ]),
        );

        final results = sut.getItemsStream();

        expect(
            results,
            emits([
              NewsModel(
                  content: 'content-1',
                  id: 'id-1',
                  title: 'title-1',
                  imageUrl: 'imageUrl-1'),
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
