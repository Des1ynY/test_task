import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubit/pin_state.dart';
import '/cubit/set_pin_cubit.dart';
import '/ui/components/enter_pin_ui.dart';

class SetPinPage extends StatelessWidget {
  const SetPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPinCubit(context: context),
      child: BlocBuilder<SetPinCubit, PinState>(
        builder: (context, state) {
          final setPinCubit = context.read<SetPinCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(setPinCubit.appBarTitle),
            ),
            body: EnterPin(
              cubit: setPinCubit,
            ),
          );
        },
      ),
    );
  }
}
