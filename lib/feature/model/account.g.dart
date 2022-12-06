// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 0;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      accountName: fields[2] as String,
      accounHolderName: fields[3] as String,
      accountNumber: fields[4] as String,
      currencyUnit: fields[5] as CurrencyUnit,
      expenses: (fields[6] as List).cast<Expense>(),
      income: (fields[7] as List).cast<Income>(),
    )
      ..id = fields[0] as String
      ..createdTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.accountName)
      ..writeByte(3)
      ..write(obj.accounHolderName)
      ..writeByte(4)
      ..write(obj.accountNumber)
      ..writeByte(5)
      ..write(obj.currencyUnit)
      ..writeByte(6)
      ..write(obj.expenses)
      ..writeByte(7)
      ..write(obj.income);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 1;

  @override
  Expense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expense(
      fields[2] as ExpenseProductTypes,
      fields[3] as String,
      fields[4] as int,
    )
      ..id = fields[0] as String
      ..createdTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.productType)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IncomeAdapter extends TypeAdapter<Income> {
  @override
  final int typeId = 2;

  @override
  Income read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Income(
      fields[2] as String,
      fields[3] as IncomeTypes,
      fields[4] as int,
    )
      ..id = fields[0] as String
      ..createdTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Income obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.incomeName)
      ..writeByte(3)
      ..write(obj.incomeType)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyUnitAdapter extends TypeAdapter<CurrencyUnit> {
  @override
  final int typeId = 3;

  @override
  CurrencyUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CurrencyUnit.turkishLira;
      case 1:
        return CurrencyUnit.americanDollar;
      case 2:
        return CurrencyUnit.euro;
      case 3:
        return CurrencyUnit.russianRuble;
      case 4:
        return CurrencyUnit.englishSterlin;
      case 5:
        return CurrencyUnit.canadanDollar;
      case 6:
        return CurrencyUnit.japaneseYen;
      case 7:
        return CurrencyUnit.chineseYuan;
      default:
        return CurrencyUnit.turkishLira;
    }
  }

  @override
  void write(BinaryWriter writer, CurrencyUnit obj) {
    switch (obj) {
      case CurrencyUnit.turkishLira:
        writer.writeByte(0);
        break;
      case CurrencyUnit.americanDollar:
        writer.writeByte(1);
        break;
      case CurrencyUnit.euro:
        writer.writeByte(2);
        break;
      case CurrencyUnit.russianRuble:
        writer.writeByte(3);
        break;
      case CurrencyUnit.englishSterlin:
        writer.writeByte(4);
        break;
      case CurrencyUnit.canadanDollar:
        writer.writeByte(5);
        break;
      case CurrencyUnit.japaneseYen:
        writer.writeByte(6);
        break;
      case CurrencyUnit.chineseYuan:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExpenseProductTypesAdapter extends TypeAdapter<ExpenseProductTypes> {
  @override
  final int typeId = 4;

  @override
  ExpenseProductTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExpenseProductTypes.general;
      case 1:
        return ExpenseProductTypes.food;
      case 2:
        return ExpenseProductTypes.clothes;
      case 3:
        return ExpenseProductTypes.drink;
      case 4:
        return ExpenseProductTypes.music;
      case 5:
        return ExpenseProductTypes.film;
      case 6:
        return ExpenseProductTypes.course;
      case 7:
        return ExpenseProductTypes.car;
      case 8:
        return ExpenseProductTypes.ticket;
      case 9:
        return ExpenseProductTypes.eTrade;
      case 10:
        return ExpenseProductTypes.electronic;
      case 11:
        return ExpenseProductTypes.rent;
      case 12:
        return ExpenseProductTypes.game;
      case 13:
        return ExpenseProductTypes.stationery;
      case 14:
        return ExpenseProductTypes.homeAppliance;
      case 15:
        return ExpenseProductTypes.toy;
      case 16:
        return ExpenseProductTypes.sport;
      case 17:
        return ExpenseProductTypes.personelCare;
      case 18:
        return ExpenseProductTypes.cosmetic;
      case 19:
        return ExpenseProductTypes.book;
      case 20:
        return ExpenseProductTypes.hobby;
      case 21:
        return ExpenseProductTypes.babyItems;
      case 22:
        return ExpenseProductTypes.petItems;
      case 23:
        return ExpenseProductTypes.outdoor;
      case 24:
        return ExpenseProductTypes.marketItems;
      case 25:
        return ExpenseProductTypes.home;
      case 26:
        return ExpenseProductTypes.office;
      case 27:
        return ExpenseProductTypes.bathroomItems;
      case 28:
        return ExpenseProductTypes.kitchenUtensils;
      case 29:
        return ExpenseProductTypes.instrument;
      case 30:
        return ExpenseProductTypes.publicTransport;
      case 31:
        return ExpenseProductTypes.debt;
      case 32:
        return ExpenseProductTypes.uber;
      case 33:
        return ExpenseProductTypes.taxi;
      case 34:
        return ExpenseProductTypes.other;
      default:
        return ExpenseProductTypes.general;
    }
  }

  @override
  void write(BinaryWriter writer, ExpenseProductTypes obj) {
    switch (obj) {
      case ExpenseProductTypes.general:
        writer.writeByte(0);
        break;
      case ExpenseProductTypes.food:
        writer.writeByte(1);
        break;
      case ExpenseProductTypes.clothes:
        writer.writeByte(2);
        break;
      case ExpenseProductTypes.drink:
        writer.writeByte(3);
        break;
      case ExpenseProductTypes.music:
        writer.writeByte(4);
        break;
      case ExpenseProductTypes.film:
        writer.writeByte(5);
        break;
      case ExpenseProductTypes.course:
        writer.writeByte(6);
        break;
      case ExpenseProductTypes.car:
        writer.writeByte(7);
        break;
      case ExpenseProductTypes.ticket:
        writer.writeByte(8);
        break;
      case ExpenseProductTypes.eTrade:
        writer.writeByte(9);
        break;
      case ExpenseProductTypes.electronic:
        writer.writeByte(10);
        break;
      case ExpenseProductTypes.rent:
        writer.writeByte(11);
        break;
      case ExpenseProductTypes.game:
        writer.writeByte(12);
        break;
      case ExpenseProductTypes.stationery:
        writer.writeByte(13);
        break;
      case ExpenseProductTypes.homeAppliance:
        writer.writeByte(14);
        break;
      case ExpenseProductTypes.toy:
        writer.writeByte(15);
        break;
      case ExpenseProductTypes.sport:
        writer.writeByte(16);
        break;
      case ExpenseProductTypes.personelCare:
        writer.writeByte(17);
        break;
      case ExpenseProductTypes.cosmetic:
        writer.writeByte(18);
        break;
      case ExpenseProductTypes.book:
        writer.writeByte(19);
        break;
      case ExpenseProductTypes.hobby:
        writer.writeByte(20);
        break;
      case ExpenseProductTypes.babyItems:
        writer.writeByte(21);
        break;
      case ExpenseProductTypes.petItems:
        writer.writeByte(22);
        break;
      case ExpenseProductTypes.outdoor:
        writer.writeByte(23);
        break;
      case ExpenseProductTypes.marketItems:
        writer.writeByte(24);
        break;
      case ExpenseProductTypes.home:
        writer.writeByte(25);
        break;
      case ExpenseProductTypes.office:
        writer.writeByte(26);
        break;
      case ExpenseProductTypes.bathroomItems:
        writer.writeByte(27);
        break;
      case ExpenseProductTypes.kitchenUtensils:
        writer.writeByte(28);
        break;
      case ExpenseProductTypes.instrument:
        writer.writeByte(29);
        break;
      case ExpenseProductTypes.publicTransport:
        writer.writeByte(30);
        break;
      case ExpenseProductTypes.debt:
        writer.writeByte(31);
        break;
      case ExpenseProductTypes.uber:
        writer.writeByte(32);
        break;
      case ExpenseProductTypes.taxi:
        writer.writeByte(33);
        break;
      case ExpenseProductTypes.other:
        writer.writeByte(34);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseProductTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IncomeTypesAdapter extends TypeAdapter<IncomeTypes> {
  @override
  final int typeId = 5;

  @override
  IncomeTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return IncomeTypes.salary;
      case 1:
        return IncomeTypes.eTrade;
      case 2:
        return IncomeTypes.tradeIncome;
      case 3:
        return IncomeTypes.realEstateIncome;
      case 4:
        return IncomeTypes.freelanceIncome;
      case 5:
        return IncomeTypes.other;
      default:
        return IncomeTypes.salary;
    }
  }

  @override
  void write(BinaryWriter writer, IncomeTypes obj) {
    switch (obj) {
      case IncomeTypes.salary:
        writer.writeByte(0);
        break;
      case IncomeTypes.eTrade:
        writer.writeByte(1);
        break;
      case IncomeTypes.tradeIncome:
        writer.writeByte(2);
        break;
      case IncomeTypes.realEstateIncome:
        writer.writeByte(3);
        break;
      case IncomeTypes.freelanceIncome:
        writer.writeByte(4);
        break;
      case IncomeTypes.other:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
