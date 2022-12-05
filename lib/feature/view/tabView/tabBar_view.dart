import 'package:easy_localization/easy_localization.dart';
import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/income_or_expense_alert_dialog.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/reporters.dart';
import 'package:easy_wallet_v2/feature/view/home/home_view.dart';
import 'package:easy_wallet_v2/feature/view/home/settings_view.dart';
import 'package:easy_wallet_v2/feature/view/pages/add_income_or_expense_view.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with BaseSingleton {
  int currentIndex = 0;

  final pageList = [const HomeView(), const SettingsView()];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Visibility(
        visible: currentIndex == 0 ? true : false,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return IncomeOrExpenseAlertDialog(
                  actions: _actionsList(context),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.wallet),
            label: LocalizationHelper.wallet,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: LocalizationHelper.settings,
          ),
        ],
        onTap: (index) {
          changeIndex(index);
        },
      ),
      body: pageList[currentIndex],
    );
  }

  List<Widget> _actionsList(BuildContext context) {
    return [
      WalletOutlineButton(
        title: LocalizationHelper.income,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddIncomeOrExpensePage(
                incomeOrExpense: IncomeOrExpense(false),
              ),
            ),
          );
        },
      ),
      WalletOutlineButton(
        title: LocalizationHelper.expense,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddIncomeOrExpensePage(
                incomeOrExpense: IncomeOrExpense(true),
              ),
            ),
          );
        },
      ),
    ];
  }
}
