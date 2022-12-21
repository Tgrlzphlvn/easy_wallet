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

  final FontWeight _fontWeight = FontWeight.w500;

  TextTheme get textTheme => TextTheme(
        headline3: GoogleFonts.rubik(
          fontSize: 26,
          fontWeight: _fontWeight,
          color: walletColors.eerieBlack,
          wordSpacing: 1,
        ),
        headline4: GoogleFonts.rubik(
          fontSize: 24,
          fontWeight: _fontWeight,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        headline5: GoogleFonts.rubik(
          fontSize: 18,
          fontWeight: _fontWeight,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        subtitle1: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: _fontWeight,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        subtitle2: GoogleFonts.rubik(
          fontSize: 12,
          fontWeight: _fontWeight,
          color: walletColors.white,
          wordSpacing: 2,
        ),
        button: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: _fontWeight,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        caption: GoogleFonts.rubik(
          fontSize: 10,
          fontWeight: _fontWeight,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        bodyText1: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: _fontWeight,
          color: walletColors.eerieBlack,
          wordSpacing: 2,
        ),
        bodyText2: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: _fontWeight,
          color: walletColors.bottleGreen,
          wordSpacing: 2,
        ),
        labelMedium: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: _fontWeight,
          color: walletColors.bittersweetShimmer,
          wordSpacing: 2,
        ),
      );
}
