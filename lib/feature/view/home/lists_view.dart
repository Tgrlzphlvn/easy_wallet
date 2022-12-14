import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/theme/text/text_theme.dart';
import 'package:easy_wallet_v2/core/theme/color/wallet_colors.dart';
import 'package:easy_wallet_v2/feature/view/pages/add_shopping_list_page.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListsView extends StatelessWidget with BaseSingleton {
  const ListsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.lists),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddShoppingListPage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: ListsCard(
              list: [],
              title: 'Shopping list',
              leadingIcon: Icons.list_alt,
              lottie: LottieHelper.showLottie(
                LottieEnum.emptyList,
                lottieHeight: context.heightGenerator(0.10),
              ),
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: ListsCard(
              list: [],
              title: 'Notes',
              leadingIcon: Icons.note_alt_outlined,
              lottie: LottieHelper.showLottie(
                LottieEnum.emptyNote,
                lottieHeight: context.heightGenerator(0.10),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListsCard<T> extends StatelessWidget with BaseSingleton {
  const ListsCard({
    Key? key,
    required this.list,
    required this.title,
    this.onPressed,
    required this.leadingIcon,
    required this.lottie,
  }) : super(key: key);

  final List<T> list;
  final String title;
  final void Function()? onPressed;
  final IconData leadingIcon;
  final Widget lottie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthGenerator(0.9),
      height: context.heightGenerator(0.2),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: context.paddingHorizontalNormal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: context.paddingHorizontalLow,
                      child: Icon(leadingIcon),
                    ),
                    Text(
                      title,
                      style: walletTextTheme.textTheme.bodyText1,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.add,
                    size: 25,
                    color: walletColors.eerieBlack,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: walletColors.eerieBlack,
          ),
          list.isEmpty
              ? lottie
              : Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return SizedBox();
                    },
                  ),
                )
        ],
      ),
    );
  }
}
