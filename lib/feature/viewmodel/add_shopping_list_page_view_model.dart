


import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/product/constants/shopping_constants.dart';
import 'package:easy_wallet_v2/product/hive/shopping/shopping_cache.dart';
import 'package:flutter/cupertino.dart';

class AddShoppingListPageViewModel extends ChangeNotifier {

  ShoppingCache _shoppingCache = ShoppingCache(ShoppingKey.shoppingKey);

  ShoppingProducts choosenProductType = ShoppingProducts.other;

  void changeShoppingProducts(ShoppingProducts selectedType) {
    choosenProductType = selectedType;
    notifyListeners();
  }
}
