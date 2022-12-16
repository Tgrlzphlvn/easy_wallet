import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/account_card.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_list_tile.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/view/pages/account/add_account_page.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget with BaseSingleton {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.wallet),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.heightGenerator(0.3),
            child: _accountCard(context),
          ),
          SizedBox(
            height: context.heightGenerator(0.08),
            child: _incomeExpenseButtonsRow(context),
          ),
          const Divider(),
          Expanded(
            child: widgetStateControllers.emptyListController(
              context.heightGenerator(0.25),
              Provider.of<HomeViewModel>(context).isIncomeList
                  ? Provider.of<HomeViewModel>(context).incomes.length
                  : Provider.of<HomeViewModel>(context).expenses.length,
              Provider.of<HomeViewModel>(context).isIncomeList
                  ? _incomeListViewBuilder(context)
                  : _expenseListViewBuilder(context),
            ),
          ),
        ],
      ),
    );
  }

  ListView _accountCard(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<HomeViewModel>(context).accounts.length,
      itemBuilder: (context, index) {
        Account account = Provider.of<HomeViewModel>(context).accounts[index];
        return AccountCard(
          account: account,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddAccountPage(),
            ),
          ),
        );
      },
    );
  }

  ListView _incomeListViewBuilder(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<HomeViewModel>(context).incomes.length,
      itemBuilder: (context, index) {
        Income income =
            Provider.of<HomeViewModel>(context, listen: false).incomes[index];
        return Padding(
          padding: context.paddingAllLow,
          child: WalletListTile(
            income: income,
            isIncome: true,
          ),
        );
      },
    );
  }

  ListView _expenseListViewBuilder(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<HomeViewModel>(context).expenses.length,
      itemBuilder: (context, index) {
        Expense expense =
            Provider.of<HomeViewModel>(context, listen: false).expenses[index];
        return Padding(
          padding: context.paddingAllLow,
          child: WalletListTile(
            expense: expense,
            isIncome: false,
          ),
        );
      },
    );
  }

  Padding _incomeExpenseButtonsRow(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalHigh,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _incomeListButton(context),
              _expenseListButton(context),
            ],
          ),
        ],
      ),
    );
  }

  WalletOutlineButton _incomeListButton(BuildContext context) {
    return WalletOutlineButton(
      onPressed: Provider.of<HomeViewModel>(context, listen: false).isIncomeList ==
              true
          ? null
          : () {
              Provider.of<HomeViewModel>(context, listen: false).getIncomes();
              Provider.of<HomeViewModel>(context, listen: false).changeListType();
            },
      title: LocalizationHelper.incomes,
    );
  }

  WalletOutlineButton _expenseListButton(BuildContext context) {
    return WalletOutlineButton(
      onPressed: Provider.of<HomeViewModel>(context, listen: false).isIncomeList ==
              false
          ? null
          : () {
              Provider.of<HomeViewModel>(context, listen: false).getExpenses();
              Provider.of<HomeViewModel>(context, listen: false).changeListType();
            },
      title: LocalizationHelper.expenses,
    );
  }
}
