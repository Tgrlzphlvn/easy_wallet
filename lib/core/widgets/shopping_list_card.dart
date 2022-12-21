import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';

class ListsCard<T> extends StatelessWidget with BaseSingleton {
  const ListsCard({
    Key? key,
    this.onPressed,
    required this.shoppingList,
  }) : super(key: key);

  final void Function()? onPressed;
  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthGenerator(0.8),
      height: context.heightGenerator(0.1),
      decoration: BoxDecoration(
        color: walletColors.white,
        borderRadius: context.borderRadiusHigh,
        border: Border.all(color: walletColors.eerieBlack, width: 1),
      ),
      child: Padding(
        padding: context.paddingHorizontalNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: context.paddingHorizontalLow,
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
                Text(
                  shoppingList.listName,
                  style: walletTextTheme.textTheme.bodyText1,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: walletColors.white,
                borderRadius: context.borderRadiusHigh,
                border: Border.all(color: walletColors.eerieBlack, width: 1),
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: context.heightGenerator(0.025),
                  color: walletColors.eerieBlack,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
