import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:easy_wallet_v2/product/utils/amount_validator.dart';
import 'package:easy_wallet_v2/product/utils/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:provider/provider.dart';
import 'package:easy_wallet_v2/product/extensions/account_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/expense_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/income_extensions.dart';

class WalletListTile extends StatelessWidget with BaseSingleton {
  const WalletListTile({Key? key, this.income, this.expense, required this.isIncome})
      : super(key: key);

  final Income? income;
  final Expense? expense;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
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
      width: context.widthGenerator(0.15),
      height: context.heightGenerator(0.05),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
      child: Icon(
        isIncome == true
            ? IconPicker.incomeIconSelector(income!.incomeType)
            : IconPicker.expenseIconSelector(expense!.productType),
        shadows: const [Shadow(blurRadius: 2)],
      ),
    );
  }

  Text _listTileTitle() {
    return Text(
      isIncome == true ? income!.incomeName : expense!.productName,
      style: walletTextTheme.textTheme.headline5,
    );
  }

  Text _listTileSubtitle() {
    return Text(
      isIncome == true ? income!.getDayMonthYear() : expense!.getDayMonthYear(),
      style: walletTextTheme.textTheme.bodyText1,
    );
  }

  Container _listTileTrailing(BuildContext context) {
    Account account = Provider.of<HomeViewModel>(context).accounts[0];
    return Container(
      width: context.widthGenerator(0.3),
      height: context.heightGenerator(0.05),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isIncome == true ? '+' : '-',
            style: isIncome == true
                ? walletTextTheme.textTheme.bodyText2
                : walletTextTheme.textTheme.labelMedium,
          ),
          Text(
            AmountValidator.amountValidator(
              isIncome == true
                  ? income!.amount.toString()
                  : expense!.amount.toString(),
            ),
            style: isIncome == true
                ? walletTextTheme.textTheme.bodyText2
                : walletTextTheme.textTheme.labelMedium,
          ),
          Icon(
            account.currencyUnitIconSelector(account.currencyUnit),
            size: 15,
            shadows: const [Shadow(blurRadius: 2)],
          ),
        ],
      ),
    );
  }
}
