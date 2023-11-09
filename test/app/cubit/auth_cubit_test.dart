import 'package:bloc_test/bloc_test.dart';
import 'package:estate_community_app/app/cubit/auth_cubit.dart';
import 'package:estate_community_app/models/user_model.dart';
import 'package:estate_community_app/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('start', () {
    blocTest<AuthCubit, AuthState>(
      'emits loading then user when success',
      build: () {
        when(mockAuthRepository.authenticationCheck).thenAnswer(
          (_) => Stream.value(
            UserModel(id: 'test-uid-1', name: 'Michal'),
          ),
        );
        return AuthCubit(authRepository: mockAuthRepository);
      },
      act: (cubit) => cubit.start(),
      expect: () => [
        const AuthState(
          user: null,
          isLoading: true,
          errorMessage: '',
        ),
        AuthState(
          user: UserModel(id: 'test-uid-1', name: 'Michal'),
          isLoading: false,
          errorMessage: '',
        ),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits loading then errorMessage when failed',
      build: () {
        when(mockAuthRepository.authenticationCheck).thenAnswer(
          (_) => Stream.error('error-message'),
        );

        return AuthCubit(authRepository: mockAuthRepository);
      },
      act: (cubit) => cubit.start(),
      expect: () => [
        const AuthState(
          user: null,
          isLoading: true,
          errorMessage: '',
        ),
        const AuthState(
          user: null,
          isLoading: false,
          errorMessage: 'error-message',
        ),
      ],
    );
  });

  group('signOut()', () {
    blocTest<AuthCubit, AuthState>('signOut() called 1 time',
        build: () {
          when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});
          return AuthCubit(authRepository: mockAuthRepository);
        },
        act: (cubit) => cubit.signOut(),
        verify: (_) {
          verify(() => mockAuthRepository.signOut()).called(1);
        });
  });
}
