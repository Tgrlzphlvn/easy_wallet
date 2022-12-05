import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class IncomeOrExpenseAlertDialog extends StatelessWidget with BaseSingleton {
  const IncomeOrExpenseAlertDialog({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
      title: Text(LocalizationHelper.pleaseSelectTheDataType),
      titlePadding: context.paddingAllMedium,
      titleTextStyle: walletTextTheme.textTheme.headline5,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: actions,
    );
  }
}
