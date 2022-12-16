import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/view/pages/shopping/add_shopping_product_page.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';

class ShoppingListPage extends StatelessWidget with BaseSingleton {
  const ShoppingListPage({Key? key, required this.shoppingList}) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.listName),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddShoppingProductPage(shoppingList: shoppingList);
                },
              );
            },
          ),
        ],
      ),
      body: shoppingList.shoppingProducts.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: LottieHelper.showLottie(LottieEnum.emptyNote)),
              ],
            )
          : ListView.builder(
              itemCount: shoppingList.shoppingProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: walletColors.white,
                    borderRadius: context.borderRadiusHigh,
                    border: Border.all(color: walletColors.eerieBlack, width: 1),
                  ),
                  child: Text(shoppingList.shoppingProducts[index].productName),
                );
              },
            ),
    );
  }
}
