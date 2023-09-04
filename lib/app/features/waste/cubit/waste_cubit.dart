import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'waste_state.dart';

class WasteCubit extends Cubit<WasteState> {
  WasteCubit() : super(WasteState());
}
