import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_dropdown_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddShoppingProductPage extends StatelessWidget with BaseSingleton {
  AddShoppingProductPage({Key? key, required this.shoppingList}) : super(key: key);

  final ShoppingList shoppingList;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _pieceController = TextEditingController();
  final TextEditingController _gramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          child: WalletTextFormField(
              controller: _pieceController,
              keyboardType: TextInputType.number,
              action: TextInputAction.next,
              inputFormatters: [],
              label: 'Piece',
              icon: Icons.category_sharp,
              nextFocusValue: 24),
        ),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: WalletOutlineButton(
            title: LocalizationHelper.save,
            onPressed: () {},
          ),
        )
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
