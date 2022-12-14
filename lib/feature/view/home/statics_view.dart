import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:flutter/material.dart';

class StaticsView extends StatelessWidget {
  const StaticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.statistics),
      ),
    );
  }
}
