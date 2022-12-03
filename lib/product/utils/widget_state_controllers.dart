import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';

class WidgetStateControllers {
  static WidgetStateControllers? _instance;
  static WidgetStateControllers get instance {
    _instance ??= WidgetStateControllers._init();
    return _instance!;
  }

  WidgetStateControllers._init();

  Widget emptyListController(double lottieHeight, int length, Widget widget) {
    return length == 0
        ? LottieHelper.showLottie(LottieEnum.cat, lottieHeight: lottieHeight)
        : widget;
  }
}
