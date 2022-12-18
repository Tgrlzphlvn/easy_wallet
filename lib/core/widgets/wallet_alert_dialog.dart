import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class IncomeOrExpenseAlertDialog extends StatelessWidget with BaseSingleton {
  const IncomeOrExpenseAlertDialog({
    Key? key,
    required this.actions, required this.title,
  }) : super(key: key);

  final List<Widget> actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
      title: Text(title),
      titlePadding: context.paddingAllMedium,
      titleTextStyle: walletTextTheme.textTheme.headline5,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: actions,
    );
  }
}
