import 'package:easy_wallet_v2/feature/model/shopping.dart';

extension ShoppingListExtension on ShoppingList {
  String getDayMonthYear() {
    return '${createdTime.day}.${createdTime.month}.${createdTime.year}';
  }

  String getMonthYear() {
    return '${createdTime.month}.${createdTime.year}';
  }

  int subShoppingPrice() {
    int total = 0;
    for (var i in shoppingProducts) {
      total += i.piece * i.price;
    }
    return total;
  }
}

extension ShoppingExtension on Shopping {
  String getDayMonthYear() {
    return '${createdTime.day}.${createdTime.month}.${createdTime.year}';
  }

  String getMonthYear() {
    return '${createdTime.month}.${createdTime.year}';
  }

  int pricePieceImpact() {
    return piece * price;
  }
}
