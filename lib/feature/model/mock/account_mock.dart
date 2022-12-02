import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';

class AccountMock {
  static List<Account> mockAccount = [
    Account(
      accountName: 'Empty Account Name',
      accounHolderName: 'Empty Account Holder Name',
      accountNumber: 12345,
      currencyUnit: CurrencyUnit.americanDollar,
      income: [Income('Other', IncomeTypes.other, 0, Icons.abc)],
      expenses: [Expense(Icons.insert_chart, ExpenseProductTypes.other, 'Other', 0)],
    ),
  ];
}
