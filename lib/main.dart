import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/providers/provider_controller.dart';
import 'package:easy_wallet_v2/feature/view/tabView/tabBar_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  ProviderController providerController = ProviderController.instance;
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: providerController.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: walletLightTheme.themeData,
      home: const TabView(),
    );
  }
}
