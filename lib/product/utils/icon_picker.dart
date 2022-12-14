import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';

class IconPicker {
  static IconData expenseIconSelector(ExpenseProductTypes expenseProductTypes) {
    switch (expenseProductTypes) {
      case ExpenseProductTypes.general:
        return Icons.store_mall_directory_rounded;
      case ExpenseProductTypes.food:
        return Icons.food_bank_outlined;
      case ExpenseProductTypes.clothes:
        return Icons.shopping_bag_outlined;
      case ExpenseProductTypes.drink:
        return Icons.coffee;
      case ExpenseProductTypes.music:
        return Icons.music_note_outlined;
      case ExpenseProductTypes.film:
        return Icons.movie_creation_outlined;
      case ExpenseProductTypes.course:
        return Icons.computer_sharp;
      case ExpenseProductTypes.car:
        return Icons.local_taxi_outlined;
      case ExpenseProductTypes.ticket:
        return Icons.airplane_ticket_outlined;
      case ExpenseProductTypes.eTrade:
        return Icons.currency_exchange;
      case ExpenseProductTypes.electronic:
        return Icons.memory;
      case ExpenseProductTypes.rent:
        return Icons.shortcut_sharp;
      case ExpenseProductTypes.game:
        return Icons.sports_esports_outlined;
      case ExpenseProductTypes.stationery:
        return Icons.mode_edit_outline_outlined;
      case ExpenseProductTypes.homeAppliance:
        return Icons.home_outlined;
      case ExpenseProductTypes.toy:
        return Icons.toys_outlined;
      case ExpenseProductTypes.sport:
        return Icons.sports_volleyball_outlined;
      case ExpenseProductTypes.personelCare:
        return Icons.auto_fix_high_outlined;
      case ExpenseProductTypes.cosmetic:
        return Icons.auto_fix_high_outlined;
      case ExpenseProductTypes.book:
        return Icons.book_outlined;
      case ExpenseProductTypes.hobby:
        return Icons.sports_bar;
      case ExpenseProductTypes.babyItems:
        return Icons.child_care;
      case ExpenseProductTypes.petItems:
        return Icons.pets;
      case ExpenseProductTypes.outdoor:
        return Icons.snowshoeing_sharp;
      case ExpenseProductTypes.marketItems:
        return Icons.shopping_cart;
      case ExpenseProductTypes.home:
        return Icons.home_outlined;
      case ExpenseProductTypes.office:
        return Icons.attach_file_outlined;
      case ExpenseProductTypes.bathroomItems:
        return Icons.bathtub_sharp;
      case ExpenseProductTypes.kitchenUtensils:
        return Icons.kitchen;
      case ExpenseProductTypes.instrument:
        return Icons.piano;
      case ExpenseProductTypes.publicTransport:
        return Icons.train_outlined;
      case ExpenseProductTypes.debt:
        return Icons.insert_chart_outlined_outlined;
      case ExpenseProductTypes.uber:
        return Icons.local_taxi_outlined;
      case ExpenseProductTypes.taxi:
        return Icons.local_taxi_outlined;
      case ExpenseProductTypes.other:
        return Icons.auto_awesome_mosaic_outlined;
    }
  }

  static IconData incomeIconSelector(IncomeTypes incomeTypes) {
    switch (incomeTypes) {
      case IncomeTypes.salary:
        return Icons.monetization_on_outlined;
      case IncomeTypes.freelanceIncome:
        return Icons.military_tech_outlined;
      case IncomeTypes.eTrade:
        return Icons.trending_up_outlined;
      case IncomeTypes.realEstateIncome:
        return Icons.real_estate_agent_outlined;
      case IncomeTypes.tradeIncome:
        return Icons.currency_exchange;
      case IncomeTypes.other:
        return Icons.work_outline_sharp;
    }
  }
}
