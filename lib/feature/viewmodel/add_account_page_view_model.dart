import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/account/account_cache.dart';
import 'package:flutter/material.dart';

class AddAccountPageViewModel extends ChangeNotifier {

  final AccountCache _accountCache = AccountCache(HiveKeys.accountKey);

  CurrencyUnit chosenCurrecyUnit = CurrencyUnit.americanDollar;

  void changeCurrencyUnit(CurrencyUnit currecyUnit) {
    chosenCurrecyUnit = currecyUnit;
    notifyListeners();
  }

  Future<void> addAccount(Account account)async  {
    await _accountCache.addObject(account);
    notifyListeners();
  }
}
