import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:easy_wallet_v2/product/constants/shopping_constants.dart';
import 'package:easy_wallet_v2/product/hive/hive_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingCache extends HiveManager<ShoppingList> {
  ShoppingCache(super.key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ShoppingIdentifire.shoppingListId)) {
      Hive.registerAdapter(ShoppingListAdapter());
      Hive.registerAdapter(ShoppingAdapter());
      Hive.registerAdapter(ShoppingProductsAdapter());
    }
  }

  @override
  Future<void> addObject(ShoppingList object) async {
    await box?.put(object.id, object);
  }

  @override
  Future<void> deleteObject(ShoppingList object) async {
    await box?.delete(object.id);
  }

  @override
  List<ShoppingList>? getObjects() {
    return box?.values.toList() as List<ShoppingList>;
  }

  Future<void> putAtObject(Shopping object, int index) async {
    await box?.putAt(index, object);
  }
}
