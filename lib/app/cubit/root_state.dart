part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  const factory RootState({
    required User? user,
    required bool isLoading,
    required String errorMessage,
  }) = _RootState;
}
