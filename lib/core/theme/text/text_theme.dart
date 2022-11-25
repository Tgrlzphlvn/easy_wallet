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
        headline3: GoogleFonts.philosopher(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        headline4: GoogleFonts.philosopher(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        headline5: GoogleFonts.philosopher(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        subtitle1: GoogleFonts.philosopher(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        subtitle2: GoogleFonts.philosopher(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        button: GoogleFonts.philosopher(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        caption: GoogleFonts.philosopher(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        bodyText1: GoogleFonts.philosopher(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
      );
}
