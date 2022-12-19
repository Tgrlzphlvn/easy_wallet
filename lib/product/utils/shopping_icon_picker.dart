import 'package:easy_wallet_v2/feature/model/shopping.dart';
import 'package:flutter/material.dart';

class ShoppingIconPicker {
  static IconData productEmojiPicker(ShoppingProducts productType) {
    switch (productType) {
      case ShoppingProducts.personalCareProducts:
        return Icons.clean_hands_outlined;
      case ShoppingProducts.dairyProducts:
        return Icons.local_drink;
      case ShoppingProducts.grainProducts:
        return Icons.grass_outlined;
      case ShoppingProducts.frozenFood:
        return Icons.icecream_outlined;
      case ShoppingProducts.cannedFood:
        return Icons.check_box_outline_blank;
      case ShoppingProducts.legumes:
        return Icons.grass;
      case ShoppingProducts.packagedFoods:
        return Icons.featured_play_list_outlined;
      case ShoppingProducts.householdCleaningProducts:
        return Icons.cleaning_services_outlined;
      case ShoppingProducts.clothingProducts:
        return Icons.dry_cleaning_outlined;
      case ShoppingProducts.electronic:
        return Icons.phone_iphone_sharp;
      case ShoppingProducts.homeAppliances:
        return Icons.table_bar_outlined;
      case ShoppingProducts.carCareProducts:
        return Icons.car_repair_outlined;
      case ShoppingProducts.utensils:
        return Icons.kitchen;
      case ShoppingProducts.mechanicTools:
        return Icons.handyman;
      case ShoppingProducts.otherMaterials:
        return Icons.other_houses_outlined;
      case ShoppingProducts.confectionery:
        return Icons.cake;
      case ShoppingProducts.fruit:
        return Icons.filter_vintage_rounded;
      case ShoppingProducts.vegetable:
        return Icons.local_florist_outlined;
      case ShoppingProducts.oil:
        return Icons.opacity_outlined;
      case ShoppingProducts.bread:
        return Icons.bakery_dining_outlined;
      case ShoppingProducts.egg:
        return Icons.egg;
      case ShoppingProducts.salt:
        return Icons.scatter_plot_rounded;
      case ShoppingProducts.sugar:
        return Icons.icecream_sharp;
      case ShoppingProducts.spice:
        return Icons.soup_kitchen_outlined;
      case ShoppingProducts.sauce:
        return Icons.fastfood_outlined;
      case ShoppingProducts.nuts:
        return Icons.noise_control_off_outlined;
      case ShoppingProducts.jam:
        return Icons.join_inner_sharp;
      case ShoppingProducts.meat:
        return Icons.kebab_dining;
      case ShoppingProducts.wine:
        return Icons.wine_bar_outlined;
      case ShoppingProducts.beer:
        return Icons.wine_bar_rounded;
      case ShoppingProducts.spirits:
        return Icons.free_breakfast_outlined;
      case ShoppingProducts.other:
        return Icons.devices_other;
    }
  }
}
