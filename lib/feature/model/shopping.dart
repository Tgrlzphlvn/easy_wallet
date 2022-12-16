import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:easy_wallet_v2/product/constants/shopping_constants.dart';

part 'shopping.g.dart';

@HiveType(typeId: ShoppingIdentifire.shoppingListId)
class ShoppingList extends HiveObject {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  DateTime createdTime = DateTime.now();
  @HiveField(2)
  final List<Shopping> shoppingProducts;
  @HiveField(3)
  final String listName;

  ShoppingList(this.shoppingProducts, this.listName);
}

@HiveType(typeId: ShoppingIdentifire.shoppingId)
class Shopping extends HiveObject {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  DateTime createdTime = DateTime.now();
  @HiveField(2)
  final String productName;
  @HiveField(3)
  final ShoppingProducts productsType;
  @HiveField(4)
  final int price;
  @HiveField(5)
  final int piece;
  @HiveField(6)
  final int? gram;

  Shopping({
    required this.productName,
    required this.price,
    this.piece = 1,
    required this.productsType,
    this.gram,
  });
}

@HiveType(typeId: ShoppingIdentifire.shoppingProducts)
enum ShoppingProducts {
  @HiveField(0)
  dairyProducts('Dairy products'),
  @HiveField(1)
  grainProducts('Grain products'),
  @HiveField(2)
  frozenFood('Frozen food'),
  @HiveField(3)
  cannedFood('Canned food'),
  @HiveField(4)
  legumes('Legumes'),
  @HiveField(5)
  packagedFoods('Packaged food'),
  @HiveField(6)
  householdCleaningProducts('Household cleaning products'),
  @HiveField(7)
  personalCareProducts('Personal care products'),
  @HiveField(8)
  clothingProducts('Clothing products'),
  @HiveField(9)
  electronic('Electronic products'),
  @HiveField(10)
  homeAppliances('Home appliances'),
  @HiveField(11)
  carCareProducts('Car care products'),
  @HiveField(12)
  utensils('Utensils'),
  @HiveField(13)
  mechanicTools('Mechanical tools'),
  @HiveField(14)
  otherMaterials('Other materials'),
  @HiveField(15)
  confectionery('Confectionery'),
  @HiveField(16)
  fruit('Fruit'),
  @HiveField(17)
  vegetable('Vegetable'),
  @HiveField(18)
  oil('Oil'),
  @HiveField(19)
  bread('Bread'),
  @HiveField(20)
  egg('Egg'),
  @HiveField(21)
  salt('Salt'),
  @HiveField(22)
  sugar('Sugar'),
  @HiveField(23)
  spice('Spice'),
  @HiveField(24)
  sauce('Sauce'),
  @HiveField(25)
  nuts('Nuts'),
  @HiveField(26)
  jam('Jam'),
  @HiveField(27)
  meat('Meat'),
  @HiveField(28)
  wine('Wine'),
  @HiveField(29)
  beer('Beer'),
  @HiveField(30)
  spirits('Alchol'),
  @HiveField(31)
  other('Other');

  final String name;

  const ShoppingProducts(this.name);
}
