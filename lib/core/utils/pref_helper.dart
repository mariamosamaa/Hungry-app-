import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _token_key = "Auth_token";
  static Future<void> savetoken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_token_key, token);
  }

  static Future<String?> gettoken() async {
    final pref = await SharedPreferences.getInstance();
   return pref.getString(_token_key);
     
  }

  static Future<void> cleartoken() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(_token_key);
  }
}
