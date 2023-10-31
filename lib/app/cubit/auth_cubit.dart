import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/user_model.dart';
import 'package:estate_community_app/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository})
      : super(
          const AuthState(
            user: null,
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;
  final AuthRepository authRepository;

  Future<void> signOut() async {
    await authRepository.signOut(); // validate
  }

// 1 (success)
// emits loading true
// emits loading false and user

// 2 (error)
// emits loading true
// emits loading false and error
  Future<void> start() async {
    emit(
      const AuthState(
        user: null,
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = authRepository.authenticationCheck().listen((user) {
      emit(
        AuthState(
          user: user,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AuthState(
            user: null,
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
