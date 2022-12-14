import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_dropdown_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_page_view_model.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddShoppingListPage extends StatelessWidget with BaseSingleton {
  AddShoppingListPage({Key? key}) : super(key: key);

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String selectedEmoji = 'Select a emoji';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add product'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: context.paddingAllHigh,
            child: LottieHelper.showLottie(
              LottieEnum.shoppingBag,
              lottieHeight: context.heightGenerator(0.18),
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
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
            child: WalletOutlineButton(
              title: selectedEmoji,
              onPressed: () {},
            ),
          )
        ],
      ),
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
            Provider.of<AddShoppingListPageViewModel>(context, listen: false)
                .changeShoppingProducts(value ?? ShoppingProducts.other);
          },
          value:
              Provider.of<AddShoppingListPageViewModel>(context).choosenProductType,
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
