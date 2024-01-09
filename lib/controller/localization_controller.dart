import 'package:flutter/material.dart';
import 'package:movie_ticket_app/l10n/l10n.dart';
import 'package:movie_ticket_app/services/localization_services.dart';

class LocalizationController extends ChangeNotifier {
  LocalizationController() {
    getLanguage();
  }
  String language = 'en';
  Locale? locale = const Locale('en');

  setLocale(String value) {
    if (L10n.all.contains(Locale(value))) {
      language = value;
      locale = Locale(language);
      addLanguage(value);
    }
    notifyListeners();
  }

  addLanguage(value) async {
    await LocalizationServices().addLanuageToDb(value);
    notifyListeners();
  }

  getLanguage() async {
    String? storedLanguage;
    storedLanguage = await LocalizationServices().getLanguageFromDb(language);

    if (storedLanguage != null && L10n.all.contains(Locale(storedLanguage))) {
      language = storedLanguage;
      locale = Locale(language);
      notifyListeners();
    }
  }
}
