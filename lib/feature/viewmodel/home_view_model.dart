import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/model/mock/account_mock.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/account/account_cache.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier with BaseSingleton {
  final AccountCache _accountCache = AccountCache(HiveKeys.accountKey);

  List<Account> accounts = [];
  List<Income> incomes = [];
  List<Expense> expenses = [];

  bool isIncomeList = true;


  void changeListType() {
    isIncomeList = !isIncomeList;
    notifyListeners();
  }

  Future<void> getAccounts() async {
    await _accountCache.init();
    accounts = _accountCache.getObjects() ?? [];
    if (accounts.isEmpty) accounts = AccountMock.mockAccount;
    notifyListeners();
  }

  Future<void> getIncomes() async {
    await _accountCache.init();
    await getAccounts();
    incomes = accounts[0].income;
    notifyListeners();
  }

  Future<void> getExpenses() async {
    await _accountCache.init();
    await getAccounts();
    expenses = accounts[0].expenses;
    notifyListeners();
  }

  Future<void> clearAll() async {
    await _accountCache.clearAll();
  }

  Future<void> delete(Account account) async {
    await _accountCache.deleteObject(account);
  }
}
