import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static List<String> get recentSearches {
    return prefs.getStringList('recent_searches') ?? [];
  }

  static set recentSearches(List<String> value) {
    prefs.setStringList('recent_searches', value);
  }
}
