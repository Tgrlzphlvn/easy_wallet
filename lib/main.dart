import 'package:easy_localization/easy_localization.dart';
import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/providers/provider_controller.dart';
import 'package:easy_wallet_v2/feature/view/tabView/tabBar_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  ProviderController providerController = ProviderController.instance;

  runApp(
    MultiProvider(
      providers: providerController.providers,
      child: EasyLocalization(
        path: LocalizationHelper.localizationPath,
        supportedLocales: LocalizationHelper.supportedLocales,
        fallbackLocale: LocalizationHelper.fallackLocale,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: LocalizationHelper.appTitle,
      theme: walletLightTheme.themeData,
      home: const TabView(),
    );
  }
}
