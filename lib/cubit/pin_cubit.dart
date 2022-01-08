import 'package:bloc/bloc.dart';
import 'pin_state.dart';

abstract class PinCubit extends Cubit<PinState> {
  String title;

  PinCubit({required this.title}) : super(const PinInitial());

  void numButtonTapped(int num) {
    emit(PinEntered(enteredPin: state.enteredPin + num.toString()));
  }

  void backspaceButtonTapped() {
    String text = state.enteredPin;
    text = text.isEmpty ? text : text.substring(0, text.length - 1);

    emit(PinEntered(enteredPin: text));
  }
}
