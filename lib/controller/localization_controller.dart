import 'package:flutter/material.dart';
import 'package:movie_ticket_app/l10n/l10n.dart';

class LocalizationController extends ChangeNotifier {
  Locale locale = const Locale('en');

  setLocale(Locale value) {
    if (L10n.all.contains(value)) {
      locale = value;
    }
    notifyListeners();
  }
}
