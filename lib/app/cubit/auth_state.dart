part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required UserModel? user,
    required bool isLoading,
    required String errorMessage,
  }) = _AuthState;
}

// if (state.errorMessage != null) { (state.errroMessage.isNotEmpty)
//  snackbar
//  container color red
// }