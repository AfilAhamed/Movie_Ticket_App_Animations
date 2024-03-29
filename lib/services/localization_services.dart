import 'package:shared_preferences/shared_preferences.dart';

class LocalizationServices {
  // add localization to sharedpreference
  Future<void> addLanuageToDb(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Language', language);
  }

  // get localization lanaguage from sharedpreference
  Future<String?> getLanguageFromDb(language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('Language');
    if (stringValue == null) {
      prefs.setString('Language', language);
      String? string = prefs.getString('Language');
      return string;
    } else {
      return stringValue;
    }
  }
}
