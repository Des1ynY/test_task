import 'package:flutter/material.dart';

import '/cubit/pin_cubit.dart';
import '/ui/appdata/theme.dart';

class NumKeyboard extends StatelessWidget {
  const NumKeyboard({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final PinCubit cubit;

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = List.generate(12, (index) {
      switch (index) {
        case 9:
          return Container();
        case 10:
          return _NumKeyboardButton(num: 0, action: () => onTap(0, context));
        case 11:
          return IconButton(
            onPressed: () => cubit.backspaceButtonTapped(),
            icon: const Icon(
              Icons.backspace_rounded,
              size: 35,
              color: CustomTheme.textColor,
            ),
          );
        default:
          return _NumKeyboardButton(
              num: index + 1, action: () => onTap(index + 1, context));
      }
    });

    return SizedBox(
      height: 410,
      width: 300,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: buttons,
      ),
    );
  }

  void onTap(int num, BuildContext context) => cubit.numButtonTapped(num);
}

class _NumKeyboardButton extends StatelessWidget {
  const _NumKeyboardButton({
    required this.num,
    required this.action,
    Key? key,
  }) : super(key: key);

  final int num;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      elevation: 0,
      highlightElevation: 0,
      fillColor: CustomTheme.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        num.toString(),
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
