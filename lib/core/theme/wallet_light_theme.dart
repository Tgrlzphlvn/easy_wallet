import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';

class WalletLightTheme with BaseSingleton {
  static WalletLightTheme? _instance;
  static WalletLightTheme get instance {
    _instance ??= WalletLightTheme._init();
    return _instance!;
  }

  WalletLightTheme._init();

  ThemeData get themeData => ThemeData(
        textTheme: walletTextTheme.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: walletColors.paleSilver,
          titleTextStyle: walletTextTheme.textTheme.headline3,
          shadowColor: walletColors.eerieBlack,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: walletColors.eerieBlack,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: walletColors.eerieBlack,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: walletColors.paleSilver,
          unselectedLabelStyle: walletTextTheme.textTheme.subtitle2,
          selectedLabelStyle: walletTextTheme.textTheme.subtitle2,
          selectedIconTheme: IconThemeData(
            color: walletColors.eerieBlack,
          ),
          selectedItemColor: walletColors.eerieBlack,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shadowColor: walletColors.eerieBlack,
            shape: const StadiumBorder(),
            side: BorderSide(
              color: walletColors.eerieBlack,
            ),
            foregroundColor: walletColors.eerieBlack,
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: walletColors.eerieBlack,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: walletColors.eerieBlack,
          ),
          iconColor: walletColors.blackOlive,
          border: OutlineInputBorder(
            borderRadius: ThemeData().borderRadiusNormal,
            borderSide: BorderSide(color: walletColors.eerieBlack),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: ThemeData().borderRadiusNormal,
            borderSide: BorderSide(color: walletColors.eerieBlack),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: ThemeData().borderRadiusNormal,
            borderSide: BorderSide(color: walletColors.eerieBlack),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: ThemeData().borderRadiusNormal,
            borderSide: BorderSide(color: walletColors.bittersweetShimmer),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: ThemeData().borderRadiusNormal,
            borderSide: BorderSide(color: walletColors.bittersweetShimmer),
          ),
        ),
      );
}
