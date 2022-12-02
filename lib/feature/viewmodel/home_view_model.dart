import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/account/account_cache.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier with BaseSingleton {
  final AccountCache _accountCache = AccountCache(HiveKeys.accountKey);

  List<Account> accounts = [];

  bool isLoading = true;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getAccounts() async {
    changeLoading();
    await _accountCache.init();
    accounts = _accountCache.getObjects() ?? [];
    changeLoading();
    notifyListeners();
  }
}
