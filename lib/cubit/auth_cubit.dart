import 'package:flutter/material.dart';

import 'pin_state.dart';
import '/cubit/pin_cubit.dart';
import '/service/shared_prefs.dart';
import '/ui/components/custom_dialog.dart';

class AuthPinCubit extends PinCubit {
  AuthPinCubit({required this.context}) : super(title: 'Enter your PIN');

  final BuildContext context;

  @override
  void numButtonTapped(int num) {
    super.numButtonTapped(num);

    if (state.enteredPin.length == 4) _authByPin();
  }

  void _authByPin() async {
    final pin = LocalStorage.getPin();
    final enteredPinIsValid = state.enteredPin == pin;

    emit(const PinInitial());

    await showCustomDialog(
      title: enteredPinIsValid
          ? 'Authentication success'
          : 'Authentication failure',
      context: context,
    );

    if (enteredPinIsValid) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}
