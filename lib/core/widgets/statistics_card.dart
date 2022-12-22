import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/widgets/statistic_chart.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/account_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/amount_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsCard extends StatelessWidget with BaseSingleton {
  const StatisticsCard({
    Key? key,
    required this.title,
    this.incomes,
    this.expenses,
  }) : super(key: key);

  final String title;
  final List<Income>? incomes;
  final List<Expense>? expenses;

  @override
  Widget build(BuildContext context) {
    final Account account =
        Provider.of<HomeViewModel>(context, listen: false).accounts[0];
    return Container(
      height: context.heightGenerator(0.4),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StatisticChart(
                account: account,
                income: incomes,
                expense: expenses,
              ),
            ),
          ),
          Text(
            title,
            style: walletTextTheme.textTheme.caption,
          ),
          Expanded(
            flex: 2,
            child: _popularIncomeOrExpenseList(account),
          ),
        ],
      ),
    );
  }

  ListView _popularIncomeOrExpenseList(Account account) {
    return ListView.builder(
      itemCount: incomes != null ? incomes?.length : expenses?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.walletCardWidgetsPaddingLow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    incomes != null
                        ? '${index + 1}- ${incomes?[index].incomeName}'
                        : '${index + 1}- ${expenses?[index].productName}',
                    style: walletTextTheme.textTheme.bodyText1,
                  ),
                  Row(
                    children: [
                      Text(
                        incomes != null ? '+' : '-',
                        style: walletTextTheme.textTheme.bodyText1,
                      ),
                      Text(
                        AmountValidator.amountValidator(
                            incomes?[index].amount.toString() ??
                                '${expenses?[index].amount}'),
                        style: walletTextTheme.textTheme.bodyText1,
                      ),
                      Icon(
                        account.currencyUnitIconSelector(account.currencyUnit),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: walletColors.eerieBlack,
              ),
            ],
          ),
        );
      },
    );
  }
}
