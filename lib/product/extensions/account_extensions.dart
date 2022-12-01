import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/enums/asset_helper_enum.dart';
import 'package:flutter/material.dart';

extension AccountExtension on Account {
  int subIncomes() {
    int total = 0;
    if (income != null) {
      for (var i in income!) {
        total += i.amount;
      }
      return total;
    }
    return total;
  }

  int subExpenses() {
    int total = 0;
    if (expenses != null) {
      for (var i in expenses!) {
        total += i.amount;
      }
      return total;
    }
    return total;
  }

  int incomeExpenseAvarage() {
    return subIncomes() - subExpenses();
  }

  AssetHelperEnum cardImageController() {
    String number = accountNumber.toString();
    switch (number.characters.first) {
      case '4':
        return AssetHelperEnum.visa;
      case '5':
        return AssetHelperEnum.mastercard;
      default:
        return AssetHelperEnum.defaultLogo;
    }
  }

  String accountNumberValidatator() {
    String firstNumber = accountNumber.toString().characters.first;
    List<String> otherNumbers = accountNumber.toString().characters.toList();
    otherNumbers.removeAt(0);
    String lastNumbers = '';
    otherNumbers.forEach((element) {
      lastNumbers += element.toString();
    });
    return '$firstNumber*** **** **** $lastNumbers';
  }

  List<Income> getIncomes() {
    return income ?? [];
  }

  List<Expense> getExpenses() {
    return expenses ?? [];
  }

  IconData currencyUnitSelector(CurrencyUnit currencyUnit) {
    switch (currencyUnit) {
      case CurrencyUnit.turkishLira:
        return Icons.currency_lira_sharp;
      case CurrencyUnit.americanDollar:
        return Icons.attach_money_rounded;
      case CurrencyUnit.euro:
        return Icons.euro;
      case CurrencyUnit.russianRuble:
        return Icons.currency_ruble;
      case CurrencyUnit.japaneseYen:
        return Icons.currency_yen;
      case CurrencyUnit.englishSterlin:
        return Icons.currency_pound;
      case CurrencyUnit.chineseYuan:
        return Icons.currency_yuan;
      case CurrencyUnit.canadanDollar:
        return Icons.attach_money_rounded;
    }
  }
}
