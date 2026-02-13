import 'package:shared_preferences/shared_preferences.dart';

/// Service to handle authentication and localStorage operations
class AuthService {
  static const String _loggedInKey = 'loggedIn';
  static const String _usernameKey = 'username';

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  /// Login user (dummy validation - any username/password works)
  static Future<bool> login(String username, String password) async {
    // Dummy validation: require non-empty username and password
    if (username.isEmpty || password.isEmpty) {
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, true);
    await prefs.setString(_usernameKey, username);
    return true;
  }

  /// Logout user
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, false);
    await prefs.remove(_usernameKey);
  }

  /// Get the logged-in username
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }
}
