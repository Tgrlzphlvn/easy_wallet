// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingListAdapter extends TypeAdapter<ShoppingList> {
  @override
  final int typeId = 7;

  @override
  ShoppingList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingList(
      shoppingProducts: (fields[2] as List).cast<Shopping>(),
      listName: fields[3] as String,
      id: fields[0] as String,
    )..createdTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ShoppingList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.shoppingProducts)
      ..writeByte(3)
      ..write(obj.listName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShoppingAdapter extends TypeAdapter<Shopping> {
  @override
  final int typeId = 6;

  @override
  Shopping read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shopping(
      productName: fields[2] as String,
      price: fields[4] as int,
      piece: fields[5] as int,
      productsType: fields[3] as ShoppingProducts,
    )
      ..id = fields[0] as String
      ..createdTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Shopping obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.productsType)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.piece);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShoppingProductsAdapter extends TypeAdapter<ShoppingProducts> {
  @override
  final int typeId = 8;

  @override
  ShoppingProducts read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ShoppingProducts.dairyProducts;
      case 1:
        return ShoppingProducts.grainProducts;
      case 2:
        return ShoppingProducts.frozenFood;
      case 3:
        return ShoppingProducts.cannedFood;
      case 4:
        return ShoppingProducts.legumes;
      case 5:
        return ShoppingProducts.packagedFoods;
      case 6:
        return ShoppingProducts.householdCleaningProducts;
      case 7:
        return ShoppingProducts.personalCareProducts;
      case 8:
        return ShoppingProducts.clothingProducts;
      case 9:
        return ShoppingProducts.electronic;
      case 10:
        return ShoppingProducts.homeAppliances;
      case 11:
        return ShoppingProducts.carCareProducts;
      case 12:
        return ShoppingProducts.utensils;
      case 13:
        return ShoppingProducts.mechanicTools;
      case 14:
        return ShoppingProducts.otherMaterials;
      case 15:
        return ShoppingProducts.confectionery;
      case 16:
        return ShoppingProducts.fruit;
      case 17:
        return ShoppingProducts.vegetable;
      case 18:
        return ShoppingProducts.oil;
      case 19:
        return ShoppingProducts.bread;
      case 20:
        return ShoppingProducts.egg;
      case 21:
        return ShoppingProducts.salt;
      case 22:
        return ShoppingProducts.sugar;
      case 23:
        return ShoppingProducts.spice;
      case 24:
        return ShoppingProducts.sauce;
      case 25:
        return ShoppingProducts.nuts;
      case 26:
        return ShoppingProducts.jam;
      case 27:
        return ShoppingProducts.meat;
      case 28:
        return ShoppingProducts.wine;
      case 29:
        return ShoppingProducts.beer;
      case 30:
        return ShoppingProducts.spirits;
      case 31:
        return ShoppingProducts.other;
      default:
        return ShoppingProducts.dairyProducts;
    }
  }

  @override
  void write(BinaryWriter writer, ShoppingProducts obj) {
    switch (obj) {
      case ShoppingProducts.dairyProducts:
        writer.writeByte(0);
        break;
      case ShoppingProducts.grainProducts:
        writer.writeByte(1);
        break;
      case ShoppingProducts.frozenFood:
        writer.writeByte(2);
        break;
      case ShoppingProducts.cannedFood:
        writer.writeByte(3);
        break;
      case ShoppingProducts.legumes:
        writer.writeByte(4);
        break;
      case ShoppingProducts.packagedFoods:
        writer.writeByte(5);
        break;
      case ShoppingProducts.householdCleaningProducts:
        writer.writeByte(6);
        break;
      case ShoppingProducts.personalCareProducts:
        writer.writeByte(7);
        break;
      case ShoppingProducts.clothingProducts:
        writer.writeByte(8);
        break;
      case ShoppingProducts.electronic:
        writer.writeByte(9);
        break;
      case ShoppingProducts.homeAppliances:
        writer.writeByte(10);
        break;
      case ShoppingProducts.carCareProducts:
        writer.writeByte(11);
        break;
      case ShoppingProducts.utensils:
        writer.writeByte(12);
        break;
      case ShoppingProducts.mechanicTools:
        writer.writeByte(13);
        break;
      case ShoppingProducts.otherMaterials:
        writer.writeByte(14);
        break;
      case ShoppingProducts.confectionery:
        writer.writeByte(15);
        break;
      case ShoppingProducts.fruit:
        writer.writeByte(16);
        break;
      case ShoppingProducts.vegetable:
        writer.writeByte(17);
        break;
      case ShoppingProducts.oil:
        writer.writeByte(18);
        break;
      case ShoppingProducts.bread:
        writer.writeByte(19);
        break;
      case ShoppingProducts.egg:
        writer.writeByte(20);
        break;
      case ShoppingProducts.salt:
        writer.writeByte(21);
        break;
      case ShoppingProducts.sugar:
        writer.writeByte(22);
        break;
      case ShoppingProducts.spice:
        writer.writeByte(23);
        break;
      case ShoppingProducts.sauce:
        writer.writeByte(24);
        break;
      case ShoppingProducts.nuts:
        writer.writeByte(25);
        break;
      case ShoppingProducts.jam:
        writer.writeByte(26);
        break;
      case ShoppingProducts.meat:
        writer.writeByte(27);
        break;
      case ShoppingProducts.wine:
        writer.writeByte(28);
        break;
      case ShoppingProducts.beer:
        writer.writeByte(29);
        break;
      case ShoppingProducts.spirits:
        writer.writeByte(30);
        break;
      case ShoppingProducts.other:
        writer.writeByte(31);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
