import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/account_card.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/view/pages/add_account_page.dart';
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
            child: ListView.builder(
              itemCount: Provider.of<HomeViewModel>(context).accounts.length,
              itemBuilder: (context, index) {
                Account _account =
                    Provider.of<HomeViewModel>(context).accounts[index];
                return AccountCard(
                  account: _account,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddAccountPage(),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: context.heightGenerator(0.08),
            child: _incomeExpenseButtonsRow(context),
          ),
          Expanded(
            child: _loadingController(
              context,
              widgetStateControllers.emptyListController(
                context.heightGenerator(0.25),
                Provider.of<HomeViewModel>(context).incomes.length,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingController(BuildContext context, Widget widget) {
    return Provider.of<HomeViewModel>(context).isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : widget;
  }

  Padding _incomeExpenseButtonsRow(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalHigh,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WalletOutlineButton(
                onPressed: () {},
                title: LocalizationHelper.incomes,
              ),
              WalletOutlineButton(
                onPressed: () {},
                title: LocalizationHelper.expenses,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
