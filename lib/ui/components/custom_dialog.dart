import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomCupertinoDialog({
  required String title,
  required BuildContext context,
  VoidCallback? action,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoButton(
            child: const Text('OK'),
            onPressed: action ?? () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

Future<void> showCustomDialog(
    {required String title, required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
      );
    },
  );
}
