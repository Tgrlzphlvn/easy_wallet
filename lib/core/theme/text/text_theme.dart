import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletLightTextTheme with BaseSingleton {
  static WalletLightTextTheme? _instance;
  static WalletLightTextTheme get instance {
    _instance ??= WalletLightTextTheme._init();
    return _instance!;
  }

  WalletLightTextTheme._init();

  TextTheme get textTheme => TextTheme(
        headline3: GoogleFonts.rubik(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        headline4: GoogleFonts.rubik(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        headline5: GoogleFonts.rubik(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        subtitle1: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        subtitle2: GoogleFonts.rubik(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        button: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        caption: GoogleFonts.rubik(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        bodyText1: GoogleFonts.rubik(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
      );
}
