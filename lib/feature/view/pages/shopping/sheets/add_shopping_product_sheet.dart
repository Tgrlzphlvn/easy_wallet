import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_dropdown_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_sheet_divider.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddShoppingProductSheet extends StatelessWidget with BaseSingleton {
  AddShoppingProductSheet({Key? key, required this.index}) : super(key: key);

  final int index;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ShoppingList shoppingList =
        Provider.of<AddShoppingListViewModel>(context, listen: false).shopping;
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const WalletDivider(),
        Padding(
          padding: context.walletCardWidgetsPaddingLow,
          child: _productTypeDropdownButton(context),
        ),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: _productNameTextFormField(),
        ),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: _amountTextFormField(),
        ),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: _pieceRow(context),
        ),
        Padding(
          padding: context.paddingAllHigh,
          child: _saveButton(context, shoppingList),
        ),
      ],
    );
  }

  WalletOutlineButton _saveButton(BuildContext context, ShoppingList shoppingList) {
    return WalletOutlineButton(
      title: LocalizationHelper.save,
      onPressed:
          _amountController.text.isEmpty || _productNameController.text.isEmpty
              ? null
              : () {
                  Provider.of<AddShoppingListViewModel>(context, listen: false)
                      .addShoppingList(
                    ShoppingList.add(
                      id: shoppingList.id,
                      shoppingProducts: shoppingList.shoppingProducts +
                          [
                            Shopping(
                              productName: _productNameController.text,
                              price: int.parse(_amountController.text),
                              productsType: Provider.of<AddShoppingListViewModel>(
                                      context,
                                      listen: false)
                                  .choosenProductType,
                              piece: Provider.of<AddShoppingListViewModel>(context,
                                      listen: false)
                                  .pieceCounter,
                            )
                          ],
                      listName: shoppingList.listName,
                    ),
                  );
                  Provider.of<AddShoppingListViewModel>(context, listen: false)
                      .getSelectedIndexList(index);
                  Navigator.of(context).pop();
                },
    );
  }

  Widget _pieceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'How many?',
          style: walletTextTheme.textTheme.bodyText1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WalletOutlineButton(
              title: '+',
              onPressed: () {
                Provider.of<AddShoppingListViewModel>(context, listen: false)
                    .incrementPiece();
              },
            ),
            Container(
              width: context.widthGenerator(0.15),
              height: context.heightGenerator(0.055),
              decoration: BoxDecoration(
                color: walletColors.white,
                borderRadius: context.borderRadiusHigh,
                border: Border.all(color: walletColors.eerieBlack, width: 1),
              ),
              child: Center(
                child: Text(
                  Provider.of<AddShoppingListViewModel>(context)
                      .pieceCounter
                      .toString(),
                  style: walletTextTheme.textTheme.headline5,
                ),
              ),
            ),
            WalletOutlineButton(
              title: '-',
              onPressed: () {
                Provider.of<AddShoppingListViewModel>(context, listen: false)
                    .reducePiece();
              },
            ),
          ],
        ),
      ],
    );
  }

  Row _productTypeDropdownButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Product type:',
          style: walletTextTheme.textTheme.bodyText1,
        ),
        WalletDropDownButton<ShoppingProducts>(
          onChanged: (value) {
            Provider.of<AddShoppingListViewModel>(context, listen: false)
                .changeShoppingProducts(value ?? ShoppingProducts.other);
          },
          value: Provider.of<AddShoppingListViewModel>(context).choosenProductType,
          items: ShoppingProducts.values
              .map<DropdownMenuItem<ShoppingProducts>>(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(
                    value.name,
                    style: walletTextTheme.textTheme.bodyText1,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  WalletTextFormField _productNameTextFormField() {
    return WalletTextFormField(
      controller: _productNameController,
      keyboardType: TextInputType.name,
      action: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(24),
      ],
      label: 'Product name',
      icon: Icons.shopping_basket,
      nextFocusValue: 24,
    );
  }

  WalletTextFormField _amountTextFormField() {
    return WalletTextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      action: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(24),
      ],
      label: 'Amount',
      icon: Icons.numbers,
      nextFocusValue: 24,
    );
  }
}
