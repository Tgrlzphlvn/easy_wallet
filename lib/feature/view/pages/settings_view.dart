import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget with BaseSingleton {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizationHelper.settings),
      ),
    );
  }
}
