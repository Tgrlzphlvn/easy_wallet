import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';

class AddAccountPage extends StatelessWidget with BaseSingleton {
  const AddAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieHelper.showLottie(
            LottieEnum.walletSettings,
            lottieHeight: context.heightGenerator(0.18),
          ),
        ],
      ),
    );
  }
}
