import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/product/constants/shopping_constants.dart';
import 'package:easy_wallet_v2/product/hive/shopping/shopping_cache.dart';
import 'package:flutter/cupertino.dart';

class AddShoppingListViewModel extends ChangeNotifier {
  final ShoppingCache _shoppingCache = ShoppingCache(ShoppingKey.shoppingKey);

  ShoppingProducts choosenProductType = ShoppingProducts.other;

  List<ShoppingList> shoppingLists = [];

  void changeShoppingProducts(ShoppingProducts selectedType) {
    choosenProductType = selectedType;
    notifyListeners();
  }

  Future<void> addShoppingList(ShoppingList shoppingList) async {
    await _shoppingCache.addObject(shoppingList);
    notifyListeners();
  }

  Future<void> getShoppingLists() async {
    await _shoppingCache.init();
    shoppingLists = _shoppingCache.getObjects() ?? [];
    notifyListeners();
  }

  Future<void> addProduct(Shopping shopping, int index) async {
    await _shoppingCache.putAtObject(shopping, index);
    notifyListeners();
  }
}
