import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_alert_dialog.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/view/pages/shopping/add_shopping_product_sheet.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_income_or_expense_view_model.dart.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingListPage extends StatelessWidget with BaseSingleton {
  const ShoppingListPage({Key? key, required this.shoppingList}) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.listName),
        actions: [
          _showDeleteAlertDialog(context),
          _showAddProductSheet(context),
        ],
      ),
      body: shoppingList.shoppingProducts.isEmpty
          ? _isEmptyLottie()
          : _shoppingProductsList(),
    );
  }

  IconButton _showDeleteAlertDialog(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_forever),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return IncomeOrExpenseAlertDialog(
              title: 'Bu listeyi silmek istediğinizden emin misiniz?',
              actions: [
                WalletOutlineButton(
                  title: 'Nevermind',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                WalletOutlineButton(
                  title: 'Delete',
                  onPressed: () {
                    Provider.of<AddShoppingListViewModel>(context, listen: false)
                        .deleteShoppingList(shoppingList);
                    Provider.of<AddShoppingListViewModel>(context, listen: false)
                        .getShoppingLists();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  IconButton _showAddProductSheet(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
          constraints: BoxConstraints(
            minHeight: context.heightGenerator(0.3),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddShoppingProductPage(shoppingList: shoppingList),
            );
          },
        );
      },
    );
  }

  Column _isEmptyLottie() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: LottieHelper.showLottie(LottieEnum.emptyNote)),
      ],
    );
  }

  ListView _shoppingProductsList() {
    return ListView.builder(
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
    );
  }
}
