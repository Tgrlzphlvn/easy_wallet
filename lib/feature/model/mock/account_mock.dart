import 'package:easy_wallet_v2/feature/model/account.dart';

class AccountMock {
  static List<Account> mockAccount = [
    Account(
      accountName: 'mockmockmockmock321',
      accounHolderName: 'Your name',
      currencyUnit: CurrencyUnit.americanDollar,
      income: [],
      expenses: [],
    ),
  ];
}
