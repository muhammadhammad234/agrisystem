import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Keys for shared preferences
  static const String _keyIsLoggedIn = "is_logged_in";
  static const String _keyUsername = "username";
  static const String _userId = "userId";

  // Save login status (true = logged in, false = logged out)
  Future<void> setLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  // Get login status
  Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Save username
  Future<void> setUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  // Get username
  Future<String?> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  Future<bool?> removeUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyUsername);
  }

  // Save token (for example, JWT or API token)
  Future<void> setUserId(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, token);
  }

  // Get token
  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }
  Future<bool?> removeUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_userId);
  }

  // Clear all saved preferences (for logout)
  Future<void> clearPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
