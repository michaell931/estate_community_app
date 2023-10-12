part of 'root_cubit.dart';

// @immutable
// class RootState {
//   final User? user;
//   final bool isLoading;
//   final String errorMessage;

@freezed
class RootState with _$RootState {
  const factory RootState({
    required User? user,
    required bool isLoading,
    required String errorMessage,
  }) = _RootState;
}
  // const RootState(
  //     {required this.user,
  //     required this.isLoading,
  //     required this.errorMessage});

