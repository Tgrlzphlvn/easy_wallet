import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/account/account_cache.dart';
import 'package:flutter/material.dart';

class StatisticViewModel extends ChangeNotifier {
  final AccountCache _accountCache = AccountCache(HiveKeys.accountKey);

  List<Income> incomes = [];
  List<Expense> expenses = [];
  List<Account> account = [];

  Future<void> getTheOrderedIncomeList() async {
    await _accountCache.init();
    account = _accountCache.getObjects() as List<Account>;

    if (account.isNotEmpty) {
      incomes = account[0].income;

      incomes.sort((x, y) => y.amount.compareTo(x.amount));
    } else {
      incomes = [];
    }
  }

  Future<void> getTheOrderedExpenseList() async {
    await _accountCache.init();
    account = _accountCache.getObjects() as List<Account>;

    if (account.isNotEmpty) {
      expenses = account[0].expenses;

      expenses.sort((x, y) => y.amount.compareTo(x.amount));
    } else {
      expenses = [];
    }
  }
}
