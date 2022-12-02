import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationHelper {

  static const String localizationPath = 'assets/translations';

  static List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  static Locale fallackLocale = const Locale('en', 'US');

  static final String appTitle = 'easy_wallet'.tr();
  static final String currentBalance = 'current_balance'.tr();
  static final String wallet = 'wallet'.tr();
  static final String settings = 'settings'.tr();
}
