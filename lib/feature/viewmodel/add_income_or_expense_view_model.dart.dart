import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/cupertino.dart';

class AddIncomeOrExpenseViewModel extends ChangeNotifier {
  ExpenseProductTypes chosenExpenseType = ExpenseProductTypes.other;
  IncomeTypes chosenIncomeType = IncomeTypes.other;

  void changeExpenseType(ExpenseProductTypes expenseProductType) {
    chosenExpenseType = expenseProductType;
    notifyListeners();
  }

  void changeIncomeType(IncomeTypes incomeType) {
    chosenIncomeType = incomeType;
    notifyListeners();
  }
}
