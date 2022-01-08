import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubit/pin_state.dart';
import '/cubit/auth_cubit.dart';
import '/ui/components/enter_pin_ui.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPinCubit(context: context),
      child: BlocBuilder<AuthPinCubit, PinState>(
        builder: (context, state) {
          final authPinCubit = context.read<AuthPinCubit>();

          return Scaffold(
            appBar: AppBar(),
            body: EnterPin(
              cubit: authPinCubit,
            ),
          );
        },
      ),
    );
  }
}
