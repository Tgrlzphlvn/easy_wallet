import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieHelper {
  static Widget showLottie(LottieEnum lottie, {double lottieHeight = 250}) {
    return Column(
      children: [
        Lottie.asset(
          'assets/lotties/${lottie.name}.json',
          height: lottieHeight,
        ),
      ],
    );
  }
}

enum LottieEnum {
  cat('cat'),
  walletSettings('wallet_settings');

  final String name;
  const LottieEnum(this.name);
}
