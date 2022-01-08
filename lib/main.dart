import 'package:flutter/material.dart';

import 'service/shared_prefs.dart';
import 'ui/pages/auth_page.dart';
import 'ui/pages/set_pin_page.dart';
import 'ui/pages/menu_page.dart';
import 'ui/appdata/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  runApp(const TestTaskApp());
}

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task',
      theme: CustomTheme.mainTheme,
      routes: {
        '/': (context) => const MenuPage(),
        '/auth': (context) => const AuthPage(),
        '/setPin': (context) => const SetPinPage(),
      },
      initialRoute: '/',
    );
  }
}
