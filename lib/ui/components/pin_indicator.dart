import 'package:flutter/material.dart';

import '/ui/appdata/theme.dart';

class PinIndicators extends StatelessWidget {
  const PinIndicators({required this.numbersEntered, Key? key})
      : super(key: key);

  final int numbersEntered;

  @override
  Widget build(BuildContext context) {
    final indicators = List.generate(
        4, (index) => _PinIndicator(color: _setIndicatorColor(index)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: indicators,
    );
  }

  Color? _setIndicatorColor(int index) {
    return numbersEntered > index ? CustomTheme.primaryColor : null;
  }
}

class _PinIndicator extends StatelessWidget {
  const _PinIndicator({required this.color, Key? key}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9,
      width: 9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.fromBorderSide(
          BorderSide(color: color ?? Colors.grey),
        ),
        color: color,
      ),
    );
  }
}
