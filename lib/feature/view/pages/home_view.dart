import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/account_card.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/mock/account_mock.dart';
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
              itemCount: Provider.of<HomeViewModel>(context).accounts.isEmpty
                  ? 1
                  : Provider.of<HomeViewModel>(context).accounts.length,
              itemBuilder: (context, index) {
                return AccountCard(
                  accountListLenght:
                      Provider.of<HomeViewModel>(context).accounts.length,
                  account: AccountMock.mockAccount[index],
                );
              },
            ),
          ),
          SizedBox(
            height: context.heightGenerator(0.08),
            child: _incomeExpenseButtonsRow(context),
          ),
        ],
      ),
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
