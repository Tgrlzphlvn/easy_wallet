import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'account.g.dart';

@HiveType(typeId: HiveIdentifire.acountId)
class Account extends HiveObject {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  DateTime createdTime = DateTime.now();
  @HiveField(2)
  final String accountName;
  @HiveField(3)
  final String accounHolderName;
  @HiveField(4)
  final int? accountNumber;
  @HiveField(5)
  final CurrencyUnit currencyUnit;
  @HiveField(6)
  final List<Expense> expenses;
  @HiveField(7)
  final List<Income> income;

  Account({
    required this.accountName,
    required this.accounHolderName,
    required this.accountNumber,
    required this.currencyUnit,
    required this.expenses,
    required this.income,
  });
}

@HiveType(typeId: HiveIdentifire.currencyUnitId)
enum CurrencyUnit {
  @HiveField(0)
  turkishLira('TL'),
  @HiveField(1)
  americanDollar('USD'),
  @HiveField(2)
  euro('EURO'),
  @HiveField(3)
  russianRuble('RUB'),
  @HiveField(4)
  englishSterlin('GBP'),
  @HiveField(5)
  canadanDollar('CAD'),
  @HiveField(6)
  japaneseYen('JPY'),
  @HiveField(7)
  chineseYuan('YUAN');

  final String name;

  const CurrencyUnit(this.name);
}

@HiveType(typeId: HiveIdentifire.expenseId)
class Expense extends HiveObject {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  DateTime createdTime = DateTime.now();
  @HiveField(2)
  final IconData icon;
  @HiveField(3)
  final ExpenseProductTypes productType;
  @HiveField(4)
  final String productName;
  @HiveField(5)
  final int amount;

  Expense(this.icon, this.productType, this.productName, this.amount);
}

@HiveType(typeId: HiveIdentifire.expenseProductTypesId)
enum ExpenseProductTypes {
  @HiveField(0)
  general('General'),
  @HiveField(1)
  food('Food'),
  @HiveField(2)
  clothes('Clothes'),
  @HiveField(3)
  drink('Drink'),
  @HiveField(4)
  music('Music'),
  @HiveField(5)
  film('Movies'),
  @HiveField(6)
  course('Course'),
  @HiveField(7)
  car('Car'),
  @HiveField(8)
  ticket('Ticket'),
  @HiveField(9)
  eTrade('E-Trade'),
  @HiveField(10)
  electronic('Electronic'),
  @HiveField(11)
  rent('Rent'),
  @HiveField(12)
  game('Game'),
  @HiveField(13)
  stationery('Stationery'),
  @HiveField(14)
  homeAppliance('Home appliance'),
  @HiveField(15)
  toy('Toy'),
  @HiveField(16)
  sport('Sport items'),
  @HiveField(17)
  personelCare('Personal care'),
  @HiveField(18)
  cosmetic('Cosmetic'),
  @HiveField(19)
  book('Book'),
  @HiveField(20)
  hobby('Hobby'),
  @HiveField(21)
  babyItems('Baby items'),
  @HiveField(22)
  petItems('Pet items'),
  @HiveField(23)
  outdoor('Outdoor'),
  @HiveField(24)
  marketItems('Market items'),
  @HiveField(25)
  home('Home'),
  @HiveField(26)
  office('Office'),
  @HiveField(27)
  bathroomItems('Bathroom items'),
  @HiveField(28)
  kitchenUtensils('Kitchen utensils'),
  @HiveField(29)
  instrument('Instrument'),
  @HiveField(30)
  publicTransport('Public transport'),
  @HiveField(31)
  debt('Debt'),
  @HiveField(32)
  uber('Uber'),
  @HiveField(33)
  taxi('Taxi'),
  @HiveField(34)
  other('Other');

  final String name;

  const ExpenseProductTypes(this.name);
}

@HiveType(typeId: HiveIdentifire.incomeId)
class Income extends HiveObject {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  DateTime createdTime = DateTime.now();
  @HiveField(2)
  final String incomeName;
  @HiveField(3)
  final IncomeTypes incomeType;
  @HiveField(4)
  final int amount;
  @HiveField(5)
  final IconData icon;

  Income(this.incomeName, this.incomeType, this.amount, this.icon);
}

@HiveType(typeId: HiveIdentifire.incomeTypeId)
enum IncomeTypes {
  @HiveField(0)
  salary('Salary'),
  @HiveField(1)
  eTrade('eTrade'),
  @HiveField(2)
  tradeIncome('Trade Income'),
  @HiveField(3)
  realEstateIncome('Real Estate Income'),
  @HiveField(4)
  freelanceIncome('Freelance Income'),
  @HiveField(5)
  other('Other');

  final String name;

  const IncomeTypes(this.name);
}
