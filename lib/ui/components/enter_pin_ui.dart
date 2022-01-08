import 'package:flutter/material.dart';

import 'num_keyboard.dart';
import 'pin_indicator.dart';
import '/cubit/pin_cubit.dart';

class EnterPin extends StatelessWidget {
  const EnterPin({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final PinCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                cubit.title,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 30),
              PinIndicators(numbersEntered: cubit.state.enteredPin.length),
            ],
          ),
          NumKeyboard(cubit: cubit),
        ],
      ),
    );
  }
}
