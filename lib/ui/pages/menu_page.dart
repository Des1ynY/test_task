import 'package:flutter/material.dart';

import '/service/shared_prefs.dart';
import '/ui/components/custom_dialog.dart';
import '/ui/appdata/theme.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinIsSetted = LocalStorage.getPin() != null;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MenuButton(
              title: 'Login by PIN',
              action: pinIsSetted
                  ? () => Navigator.pushNamed(context, '/auth')
                  : () => showCustomDialog(
                        title: 'No setted PIN',
                        context: context,
                      ),
            ),
            const SizedBox(height: 10),
            _MenuButton(
              title: 'Set PIN',
              action: () => Navigator.pushNamed(
                context,
                '/setPin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends MaterialButton {
  _MenuButton({required String title, required VoidCallback action})
      : super(
          onPressed: action,
          minWidth: 300,
          height: 50,
          color: CustomTheme.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: CustomTheme.textColor,
            ),
          ),
        );
}
