import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationHelper {
  static const String localizationPath = 'assets/translations';

  static List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  static Locale fallackLocale = const Locale('en', 'US');

  //* App Title
  //static final String appTitle = 'easy_wallet'.tr();

  //* Tab Bar Strings
  static final String wallet = 'wallet'.tr();
  static final String settings = 'settings'.tr();
  static final String statistics = 'statistics'.tr();
  static final String lists = 'lists'.tr();

  //* Home View Strings
  static final String currentBalance = 'current_balance'.tr();
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

  //* Add Income or Expense View Strings
  static final String name = 'name'.tr();
  static final String amount = 'amount'.tr();
  static final String chooseType = 'choose_a_type'.tr();

  //* Add Income or Expense Alert Strings
  static final String pleaseSelectTheDataType = 'please_select_the_data'.tr();
  static final String income = 'income'.tr();
  static final String expense = 'expense'.tr();
  static final String addIncomeOrExpenseTitle = 'add_a_new_value'.tr();
  static final String save = 'save'.tr();
}
