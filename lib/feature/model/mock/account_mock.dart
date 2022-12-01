import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';

class AccountMock {
  static Account mockAccount = Account(
    accountName: 'Empty',
    accounHolderName: 'Account name',
    accountNumber: 55678,
    currencyUnit: CurrencyUnit.americanDollar,
    income: [Income('Salary', IncomeTypes.salary, 17990, Icons.abc)],
    expenses: [Expense(Icons.insert_chart, ExpenseProductTypes.other, 'Empty', 0)],
  );
}
