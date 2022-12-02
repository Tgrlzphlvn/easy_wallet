import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';

class WalletOutlineButton extends StatelessWidget {
  const WalletOutlineButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(context.widthValue01, context.heightValue005),
      ),
      child: Text(title),
    );
  }
}
