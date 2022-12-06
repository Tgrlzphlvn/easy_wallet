import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/account/account_cache.dart';
import 'package:flutter/cupertino.dart';

class AddIncomeOrExpenseViewModel extends ChangeNotifier {
  final AccountCache _accountCache = AccountCache(HiveKeys.accountKey);

  ExpenseProductTypes chosenExpenseType = ExpenseProductTypes.other;
  IncomeTypes chosenIncomeType = IncomeTypes.other;

  List<Account> accounts = [];

  void changeExpenseType(ExpenseProductTypes expenseProductType) {
    chosenExpenseType = expenseProductType;
    notifyListeners();
  }

  void changeIncomeType(IncomeTypes incomeType) {
    chosenIncomeType = incomeType;
    notifyListeners();
  }

  Future<void> addIncomeOrExpense(Account account) async {
    await _accountCache.init();
    await _accountCache.putObject(account);
    notifyListeners();
  }
}
