import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_alert_dialog.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/view/pages/shopping/sheets/add_shopping_product_sheet.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/account_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/shoppingList_extensions.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/amount_validator.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:easy_wallet_v2/product/utils/shopping_icon_picker.dart';

class ShoppingListPage extends StatelessWidget with BaseSingleton {
  ShoppingListPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<HomeViewModel>(context, listen: false).accounts[0];
    ShoppingList shoppingList =
        Provider.of<AddShoppingListViewModel>(context, listen: false).shopping;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          shoppingList.listName,
          style: walletTextTheme.textTheme.headline5,
        ),
        actions: [
          _showDeleteAlertDialog(context, shoppingList),
          _showAddProductSheet(context, shoppingList),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        width: context.widthGenerator(0.4),
        height: context.heightGenerator(0.05),
        decoration: BoxDecoration(
          color: walletColors.paleSilver,
          borderRadius: context.borderRadiusMedium,
          boxShadow: [BoxShadow(color: walletColors.eerieBlack, blurRadius: 6)],
          border: Border.all(color: walletColors.eerieBlack, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AmountValidator.amountValidator(
                    shoppingList.subShoppingPrice().toString(),
                  ),
                  style: walletTextTheme.textTheme.bodyText1,
                ),
                Icon(
                  account.currencyUnitIconSelector(account.currencyUnit),
                  size: context.widthGenerator(0.04),
                ),
              ],
            ),
            Text(
              'Total price',
              style: walletTextTheme.textTheme.caption,
            ),
          ],
        ),
      ),
      body: Provider.of<AddShoppingListViewModel>(context)
              .shopping
              .shoppingProducts
              .isEmpty
          ? _isEmptyLottie()
          : _shoppingProductsList(context, account, shoppingList),
    );
  }

  IconButton _showDeleteAlertDialog(BuildContext context, ShoppingList shopping) {
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
                        .deleteShoppingList(shopping);
                    Provider.of<AddShoppingListViewModel>(context, listen: false)
                        .getShoppingLists();
                    Navigator.of(context).pop();
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

  IconButton _showAddProductSheet(BuildContext context, ShoppingList shoppingList) {
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
            Provider.of<AddShoppingListViewModel>(context, listen: false)
                .getSelectedIndexList(index);
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddShoppingProductSheet(
                index: index,
              ),
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

  ListView _shoppingProductsList(
      BuildContext context, Account account, ShoppingList shoppingList) {
    return ListView.builder(
      itemCount: Provider.of<AddShoppingListViewModel>(context)
          .shopping
          .shoppingProducts
          .length,
      itemBuilder: (context, index) {
        Shopping shopping =
            Provider.of<AddShoppingListViewModel>(context, listen: false)
                .shopping
                .shoppingProducts[index];
        return Padding(
          padding: context.paddingAllLow,
          child: Container(
            decoration: BoxDecoration(
              color: walletColors.white,
              borderRadius: context.borderRadiusHigh,
              border: Border.all(color: walletColors.eerieBlack, width: 1),
            ),
            child: ListTile(
              leading: Container(
                width: context.widthGenerator(0.15),
                height: context.heightGenerator(0.05),
                decoration: BoxDecoration(
                  color: walletColors.white,
                  borderRadius: context.borderRadiusMedium,
                  border: Border.all(color: walletColors.eerieBlack, width: 1),
                ),
                child: Center(
                  child: Icon(
                    ShoppingIconPicker.productEmojiPicker(shopping.productsType),
                    color: walletColors.eerieBlack,
                  ),
                ),
              ),
              title: Text(
                shopping.productName,
                style: walletTextTheme.textTheme.bodyText1,
              ),
              subtitle: Text(
                '${shopping.piece} adet (${shopping.piece} x ${shopping.price} = ${shopping.pricePieceImpact()})',
                style: walletTextTheme.textTheme.caption,
              ),
              trailing: Container(
                width: context.widthGenerator(0.25),
                height: context.heightGenerator(0.05),
                decoration: BoxDecoration(
                  color: walletColors.white,
                  borderRadius: context.borderRadiusMedium,
                  border: Border.all(color: walletColors.eerieBlack, width: 1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AmountValidator.amountValidator(
                          shopping.pricePieceImpact().toString(),
                        ),
                        style: walletTextTheme.textTheme.bodyText1,
                      ),
                      Icon(
                        account.currencyUnitIconSelector(account.currencyUnit),
                        size: context.widthGenerator(0.04),
                        color: walletColors.eerieBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
