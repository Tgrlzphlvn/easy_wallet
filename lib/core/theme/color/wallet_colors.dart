import 'package:flutter/material.dart';

class WalletColors {
  static WalletColors? _instance;
  static WalletColors get instance {
    _instance ??= WalletColors._init();
    return _instance!;
  }

  WalletColors._init();

  Color white = Colors.white;
  Color grey = Colors.grey;
  Color black = Colors.black;
  Color transparent = Colors.transparent;
  Color eerieBlack = const Color.fromRGBO(37, 36, 34, 1);
  Color blackOlive = const Color.fromRGBO(64, 61, 57, 1);
  Color paleSilver = const Color.fromRGBO(204, 197, 185, 1);
  Color bittersweetShimmer = const Color.fromRGBO(188, 71, 73, 1);
  Color morningBlue = const Color.fromRGBO(132, 165, 157, 1);
  Color lightCoral = const Color.fromRGBO(242, 132, 130, 1);
  Color oldLevander = const Color.fromRGBO(109, 104, 117, 1);
  Color pacificBlue = const Color.fromRGBO(0, 180, 216, 1);

}
