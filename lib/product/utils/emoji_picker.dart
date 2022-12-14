import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:emojis/emoji.dart';

class EmojiPicker {
  static Emoji? productEmojiPicker(ShoppingProducts productType) {
    switch (productType) {
      case ShoppingProducts.personalCareProducts:
        return Emoji.byName('car');
      case ShoppingProducts.dairyProducts:
        return Emoji.byName('milk');
      case ShoppingProducts.grainProducts:
        return Emoji.byName('grain');
      case ShoppingProducts.frozenFood:
        return Emoji.byName('frozen');
      case ShoppingProducts.cannedFood:
        return Emoji.byName('canned food');
      case ShoppingProducts.legumes:
        return Emoji.byName('legume');
      case ShoppingProducts.packagedFoods:
        return Emoji.byName('chocolate bar');
      case ShoppingProducts.householdCleaningProducts:
        return Emoji.byName('carer');
      case ShoppingProducts.clothingProducts:
        return Emoji.byName('clothes');
      case ShoppingProducts.electronic:
        return Emoji.byName('electronics');
      case ShoppingProducts.homeAppliances:
        return Emoji.byName('lamp');
      case ShoppingProducts.carCareProducts:
        return Emoji.byName('car');
      case ShoppingProducts.utensils:
        return Emoji.byName('utensils');
      case ShoppingProducts.mechanicTools:
        return Emoji.byName('mechanic');
      case ShoppingProducts.otherMaterials:
        return Emoji.byName('soccer ball');
      case ShoppingProducts.confectionery:
        return Emoji.byName('sweets');
      case ShoppingProducts.fruit:
        return Emoji.byName('apple');
      case ShoppingProducts.vegetable:
        return Emoji.byName('vegetable');
      case ShoppingProducts.oil:
        return Emoji.byName('oil');
      case ShoppingProducts.bread:
        return Emoji.byName('bread');
      case ShoppingProducts.egg:
        return Emoji.byName('chicken');
      case ShoppingProducts.salt:
        return Emoji.byName('salt');
      case ShoppingProducts.sugar:
        return Emoji.byName('sugar');
      case ShoppingProducts.spice:
        return Emoji.byName('salt');
      case ShoppingProducts.sauce:
        return Emoji.byName('ketchup');
      case ShoppingProducts.nuts:
        return Emoji.byName('nuts');
      case ShoppingProducts.jam:
        return Emoji.byName('frozen');
      case ShoppingProducts.meat:
        return Emoji.byName('beef');
      case ShoppingProducts.wine:
        return Emoji.byName('wine');
      case ShoppingProducts.beer:
        return Emoji.byName('beer');
      case ShoppingProducts.spirits:
        return Emoji.byName('alcohol');
      case ShoppingProducts.other:
        return Emoji.byName('pancakes');
    }
  }
}
