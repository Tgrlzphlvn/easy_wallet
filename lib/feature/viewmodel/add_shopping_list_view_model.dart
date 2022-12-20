import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/product/constants/shopping_constants.dart';
import 'package:easy_wallet_v2/product/hive/shopping/shopping_cache.dart';
import 'package:flutter/cupertino.dart';

class AddShoppingListViewModel extends ChangeNotifier {
  final ShoppingCache _shoppingCache = ShoppingCache(ShoppingKey.shoppingKey);

  ShoppingProducts choosenProductType = ShoppingProducts.other;
  int pieceCounter = 1;

  List<ShoppingList> shoppingLists = [];
  late ShoppingList shopping;

  void incrementPiece() {
    pieceCounter += 1;
    notifyListeners();
  }

  void reducePiece() {
    if (pieceCounter != 0) {
      pieceCounter -= 1;
    }
    notifyListeners();
  }

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

  Future<void> deleteShoppingList(ShoppingList list) async {
    await _shoppingCache.deleteObject(list);
    notifyListeners();
  }

  Future<void> getSelectedIndexList(int index) async {
    await getShoppingLists();
    shopping = shoppingLists[index];
    notifyListeners();
  }
}
