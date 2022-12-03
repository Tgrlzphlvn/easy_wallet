import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/extensions/account_extensions.dart';
import 'package:easy_wallet_v2/product/utils/amount_validator.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';

class AccountCard extends StatelessWidget with BaseSingleton {
  const AccountCard(
      {Key? key,
      required this.account,
      required this.onPressed,
      required this.accountListLenght})
      : super(key: key);

  final Account account;
  final void Function() onPressed;
  final int accountListLenght;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.walletCardWidgetsPaddingHigh,
      child: Container(
        height: context.heightGenerator(0.25),
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusHigh,
          boxShadow: [BoxShadow(color: walletColors.black, blurRadius: 8)],
          gradient: LinearGradient(
            colors: [
              walletColors.eerieBlack,
              walletColors.blackOlive,
            ],
            tileMode: TileMode.mirror,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: context.walletCardWidgetsPaddingHigh,
              child: _cardImage(context),
            ),
            Padding(
              padding: context.walletCardWidgetsPaddingLow,
              child: _currentBalanceText(context),
            ),
            Padding(
              padding: context.walletCardWidgetsPaddingLow,
              child: _accountAmount(context),
            ),
            Padding(
              padding: context.walletCardWidgetsPaddingLow,
              child: _cardNumber(context),
            ),
          ],
        ),
      ),
    );
  }

  Row _cardImage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        accountListLenght == 0
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.add_card_rounded,
                  color: walletColors.white,
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: context.widthGenerator(0.25),
          height: context.heightGenerator(0.06),
          child: Image.asset(
            assetHelper.getPaymetSystemLogoPNG(account.cardImageController()),
          ),
        ),
      ],
    );
  }

  Row _currentBalanceText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocalizationHelper.currentBalance,
          style: context.textTheme.subtitle2,
        ),
      ],
    );
  }

  Row _accountAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '\$${AmountValidator.amountValidator(account.incomeExpenseAvarage().toString())}',
          style: context.textTheme.headline4,
        ),
      ],
    );
  }

  Row _cardNumber(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          account.accountNumberValidatator(),
          style: context.textTheme.headline4,
        ),
      ],
    );
  }
}
