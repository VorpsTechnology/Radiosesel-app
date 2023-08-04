import 'package:music_streaming_mobile/helper/common_import.dart';

class SharedPrefs {

  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<String> getAuthorizationKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('authKey') as String;
  }

  void clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('darkMode') as bool? ?? false;
  }

  setProMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPro', value);
  }


  Future<bool> isProMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('isPro') as bool? ?? false;
  }

}
