import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_sheet_divider.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddShoppingListSheet extends StatelessWidget with BaseSingleton {
  AddShoppingListSheet({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const WalletDivider(),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: _nameTextFormField(),
        ),
        Padding(
          padding: context.walletCardWidgetsPaddingHigh,
          child: _saveButton(context),
        ),
      ],
    );
  }

  WalletOutlineButton _saveButton(BuildContext context) {
    return WalletOutlineButton(
      title: 'Save',
      onPressed: _nameController.text.isEmpty
          ? null
          : () {
              Provider.of<AddShoppingListViewModel>(context, listen: false)
                  .addShoppingList(
                ShoppingList.create(
                  shoppingProducts: [],
                  listName: _nameController.text,
                ),
              );
              Provider.of<AddShoppingListViewModel>(context, listen: false)
                  .getShoppingLists();
              Navigator.of(context).pop();
            },
    );
  }

  WalletTextFormField _nameTextFormField() {
    return WalletTextFormField(
      controller: _nameController,
      keyboardType: TextInputType.name,
      action: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(24),
      ],
      label: 'List name',
      icon: Icons.text_snippet_outlined,
      nextFocusValue: 24,
    );
  }
}
