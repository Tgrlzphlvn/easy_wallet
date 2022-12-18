import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/list_card.dart';
import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/feature/view/pages/shopping/add_shopping_list_sheet.dart';
import 'package:easy_wallet_v2/feature/view/pages/shopping/shopping_list_page.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape:
                      RoundedRectangleBorder(borderRadius: context.borderRadiusHigh),
                  constraints: BoxConstraints(
                    minHeight: context.heightGenerator(0.3),
                  ),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AddShoppingListSheet(),
                    );
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Provider.of<AddShoppingListViewModel>(context, listen: false)
              .shoppingLists
              .isEmpty
          ? _emptyLottie(context)
          : _shoppinglists(context),
    );
  }

  ListView _shoppinglists(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<AddShoppingListViewModel>(context).shoppingLists.length,
      itemBuilder: (context, index) {
        ShoppingList shoppingList =
            Provider.of<AddShoppingListViewModel>(context, listen: false)
                .shoppingLists[index];
        return Padding(
          padding: context.paddingAllLow,
          child: ListsCard(
            shoppingList: shoppingList,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShoppingListPage(
                    shoppingList: shoppingList,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Column _emptyLottie(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LottieHelper.showLottie(
            LottieEnum.emptyList,
            lottieHeight: context.heightGenerator(0.25),
          ),
        ),
      ],
    );
  }
}
