import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class WalletDivider extends StatelessWidget with BaseSingleton{
  const WalletDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          height: context.heightGenerator(0.002),
          width: context.widthGenerator(0.3),
          color: walletColors.eerieBlack,
        ),
      ),
    );
  }
}
