import 'package:estate_community_app/data_sources/auth_data_source.dart';
import 'package:estate_community_app/models/user_model.dart';
import 'package:estate_community_app/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

void main() {
  late AuthRepository sut;
  late MockAuthDataSource dataSource;

  setUp(() {
    dataSource = MockAuthDataSource();
    sut = AuthRepository(authDataSource: dataSource);
  });

  group('AuthRepository', () {
    group('signOut()', () {
      test('signOut() called 1 time', () async {
        when(() => dataSource.signOut()).thenAnswer((_) async {});

        await sut.signOut();

        verify(() => dataSource.signOut()).called(1);
      });
    });
    group('start', () {
      test('emits loading then user when success', () {
        when(() => dataSource.authenticationCheck()).thenAnswer(
          (_) => Stream.value(
            UserModel(id: 'test-id', name: 'Tomasz'),
          ),
        );
        sut.authenticationCheck();
        final results = sut.authenticationCheck();
        expect(results, emits(UserModel(id: 'test-id', name: 'Tomasz')));
      });
      test('emits loading then errorMessage when failed', () {
        when(() => dataSource.authenticationCheck())
            .thenAnswer((_) => Stream.error('error-message'));
        sut.authenticationCheck();
        final results = sut.authenticationCheck();
        expect(
          results,
          emitsError('error-message'),
        );
      });
    });
  });
}
