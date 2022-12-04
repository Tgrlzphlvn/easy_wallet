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
  static final String expenses = 'expenses'.tr();
  static final String incomes = 'incomes'.tr();
  static final String addAccount = 'add_account'.tr();
  static final String accountName = 'account_name'.tr();
  static final String accountHolderName = 'account_holder_name'.tr();
  static final String accountNumber = 'account_number'.tr();
  static final String saveAccount = 'save_account'.tr();
  static final String chooseCurrency = 'choose_currency'.tr();

  //* Validation Strings
  static final String cannotEmpty = 'cannot_empty'.tr();
}
