import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/view/pages/home_view.dart';
import 'package:easy_wallet_v2/feature/view/pages/settings_view.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with BaseSingleton {
  int currentIndex = 0;

  final pageList = [const HomeView(), const SettingsView()];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Visibility(
        visible: currentIndex == 0 ? true : false,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.wallet),
            label: localizationHelper.wallet,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: localizationHelper.settings,
          ),
        ],
        onTap: (index) {
          changeIndex(index);
        },
      ),
      body: pageList[currentIndex],
    );
  }
}
