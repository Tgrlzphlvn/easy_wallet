import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:easy_wallet_v2/product/utils/amount_validator.dart';
import 'package:easy_wallet_v2/product/utils/icon_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/income_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:provider/provider.dart';
import 'package:easy_wallet_v2/product/extensions/account_extensions.dart';

class WalletListTile extends StatelessWidget with BaseSingleton {
  const WalletListTile({Key? key, required this.income}) : super(key: key);

  final Income income;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: walletColors.white,
          borderRadius: context.borderRadiusHigh,
          boxShadow: [BoxShadow(color: walletColors.eerieBlack, blurRadius: 6)]),
      child: ListTile(
        leading: _listTileLeading(context),
        title: _listTileTitle(),
        subtitle: _listTileSubtitle(),
        trailing: _listTileTrailing(context),
      ),
    );
  }

  Container _listTileLeading(BuildContext context) {
    return Container(
      width: context.widthGenerator(0.09),
      height: context.heightGenerator(0.08),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
      ),
      child: Icon(
        IconControllers.incomeIconSelector(income.incomeType),
        shadows: const [Shadow(blurRadius: 2)],
      ),
    );
  }

  Text _listTileTitle() {
    return Text(
      income.incomeName,
      style: walletTextTheme.textTheme.headline5,
    );
  }

  Text _listTileSubtitle() {
    return Text(
      income.getDayMonthYear(),
      style: walletTextTheme.textTheme.bodyText1,
    );
  }

  Container _listTileTrailing(BuildContext context) {
    Account _account = Provider.of<HomeViewModel>(context).accounts[0];
    return Container(
      width: context.widthGenerator(0.3),
      height: context.heightGenerator(0.05),
      decoration: BoxDecoration(
          color: walletColors.white,
          borderRadius: context.borderRadiusHigh,
          boxShadow: [BoxShadow(color: walletColors.eerieBlack, blurRadius: 6)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _account.currencyUnitIconSelector(_account.currencyUnit),
            size: 15,
            shadows: const [Shadow(blurRadius: 2)],
          ),
          Text(
            AmountValidator.amountValidator(
              income.amount.toString(),
            ),
            style: walletTextTheme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}