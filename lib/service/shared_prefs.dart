import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setPin(String value) async {
    await _sharedPreferences.setString('pin', value);
  }

  static String? getPin() {
    return _sharedPreferences.getString('pin');
  }
}
