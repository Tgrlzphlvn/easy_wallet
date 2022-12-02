import 'package:easy_localization/easy_localization.dart';
import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/providers/provider_controller.dart';
import 'package:easy_wallet_v2/feature/view/tabView/tabBar_view.dart';
import 'package:easy_wallet_v2/product/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ProviderController providerController = ProviderController.instance;
  AssetHelper assetHelper = AssetHelper.instance;

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  runApp(
    MultiProvider(
      providers: providerController.providers,
      child: EasyLocalization(
        path: assetHelper.localizationPath,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('tr', 'TR'),
        ],
        fallbackLocale: const Locale('en', 'US'),
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
      title: localizationHelper.appTitle,
      theme: walletLightTheme.themeData,
      home: const TabView(),
    );
  }
}
