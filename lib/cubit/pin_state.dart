import 'package:equatable/equatable.dart';

abstract class PinState extends Equatable {
  const PinState(this.enteredPin);

  final String enteredPin;

  @override
  List<Object> get props => [enteredPin];
}

class PinInitial extends PinState {
  const PinInitial() : super('');
}

class PinEntered extends PinState {
  const PinEntered({required String enteredPin}) : super(enteredPin);
}
