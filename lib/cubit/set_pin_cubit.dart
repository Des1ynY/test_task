import 'package:flutter/material.dart';

import '/cubit/pin_cubit.dart';
import '/cubit/pin_state.dart';
import '/service/shared_prefs.dart';
import '/ui/components/custom_dialog.dart';

class SetPinCubit extends PinCubit {
  SetPinCubit({required this.context}) : super(title: 'Create PIN');

  final BuildContext context;
  final String appBarTitle = 'Setup PIN';
  String? _pinToVerify;

  @override
  void numButtonTapped(int num) {
    super.numButtonTapped(num);

    if (state.enteredPin.length == 4) {
      _pinToVerify != null ? _verifyPin() : _toPinVerification();
    }
  }

  void _toPinVerification() {
    title = 'Re-enter your PIN';
    _pinToVerify = state.enteredPin;

    emit(const PinInitial());
  }

  void _verifyPin() {
    final pinVerified = state.enteredPin == _pinToVerify;

    showCustomCupertinoDialog(
      title: pinVerified
          ? 'Your PIN has been set up succesfully!'
          : 'Pins don\'t match! Try again.',
      context: context,
      action: pinVerified
          ? () async {
              await LocalStorage.setPin(state.enteredPin);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          : () {
              emit(const PinInitial());
              Navigator.pop(context);
            },
    );
  }
}
