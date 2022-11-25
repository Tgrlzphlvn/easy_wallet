import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/enums/asset_helper_enum.dart';
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
  final List<Expense>? expenses;
  @HiveField(7)
  final List<Income>? income;

  Account({
    required this.accountName,
    required this.accounHolderName,
    required this.accountNumber,
    required this.currencyUnit,
    this.expenses,
    this.income,
  });

  int subIncomes() {
    int total = 0;
    if (income != null) {
      for (var i in income!) {
        total += i.amount;
      }
      return total;
    }
    return total;
  }

  int subExpenses() {
    int total = 0;
    if (expenses != null) {
      for (var i in expenses!) {
        total += i.amount;
      }
      return total;
    }
    return total;
  }

  int incomeExpenseAvarage() {
    return subIncomes() - subExpenses();
  }

  AssetHelperEnum cardImageController() {
    String number = accountNumber.toString();
    switch (number.characters.first) {
      case '4':
        return AssetHelperEnum.visa;
      case '5':
        return AssetHelperEnum.mastercard;
      default:
        return AssetHelperEnum.defaultLogo;
    }
  }

  String accountNumberValidatator() {
    String firstNumber = accountNumber.toString().characters.first;
    List<String> otherNumbers = accountNumber.toString().characters.toList();
    otherNumbers.removeAt(0);
    String lastNumbers = '';
    otherNumbers.forEach((element) {
      lastNumbers += element.toString();
    });
    return '$firstNumber*** **** **** $lastNumbers';
  }
}

@HiveType(typeId: HiveIdentifire.currencyUnitId)
enum CurrencyUnit {
  @HiveField(0)
  turkishLira('TL'),
  @HiveField(1)
  azerbaijanManat('AZN'),
  @HiveField(2)
  americanDollar('USD'),
  @HiveField(3)
  euro('EURO'),
  @HiveField(4)
  russianRuble('RUB'),
  @HiveField(5)
  isrealSeqel('ILS'),
  @HiveField(6)
  polandZloty('PLN'),
  @HiveField(7)
  englishSterlin('GBP'),
  @HiveField(8)
  canadanDollar('CAD'),
  @HiveField(9)
  denmarkKron('DKK'),
  @HiveField(10)
  swedenKron('SEK'),
  @HiveField(11)
  norwayKron('NOK');

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
  final Icon icon;
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

  Income(this.incomeName, this.incomeType, this.amount);
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