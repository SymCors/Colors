import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// This file contains the localization class
class Localization {
  /// English locale
  static const Locale english = Locale('en');

  /// Turkish locale
  static const Locale turkish = Locale('tr');

  /// Turkish locale
  static const Locale ukranian = Locale('uk');

  /// This method is used to get the code of the supported languages
  static const Locale fallBackLocale = english;

  /// This method is used to get the code of the supported languages
  static const List<String> supportedLanguagesCode = ['en', 'tr', 'uk'];

  /// This method is used to get the locale of the supported languages
  static const List<Locale> supportedLanguagesLocale = [
    english,
    turkish,
    ukranian,
  ];

  /// This method is used to get the names of the supported languages.
  /// The value of the key is translated into the current language.
  /// Therefore, the value should be in the translations file.
  static final Map<String, String> supportedLanguages = {
    'en': 'english',
    'tr': 'turkish',
    'uk': 'ukranian',
  };

  /// This method is used to change the current language
  static void changeLanguage(BuildContext context, Locale language) {
    context.setLocale(language);
  }
}
