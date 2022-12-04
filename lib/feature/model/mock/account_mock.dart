import 'package:easy_wallet_v2/feature/model/account.dart';

class AccountMock {
  static List<Account> mockAccount = [
    Account(
      accountName: 'mockmockmockmock321',
      accounHolderName: 'Empty Account Holder Name',
      accountNumber: '12345',
      currencyUnit: CurrencyUnit.americanDollar,
      income: [],
      expenses: [],
    ),
  ];
}
