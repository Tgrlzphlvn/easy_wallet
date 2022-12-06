import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/product/constants/hive_constants.dart';
import 'package:easy_wallet_v2/product/hive/hive_manager.dart';
import 'package:hive_flutter/adapters.dart';

class AccountCache extends HiveManager<Account> {
  AccountCache(super.key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveIdentifire.acountId)) {
      Hive.registerAdapter(AccountAdapter());
      Hive.registerAdapter(CurrencyUnitAdapter());
      Hive.registerAdapter(ExpenseAdapter());
      Hive.registerAdapter(ExpenseProductTypesAdapter());
      Hive.registerAdapter(IncomeAdapter());
      Hive.registerAdapter(IncomeTypesAdapter());
    }
  }

  @override
  Future<void> addObject(Account object) async {
    await box?.put(object.id, object);
  }

  @override
  Future<void> deleteObject(Account object) async {
    await box?.delete(object.id);
  }

  @override
  List<Account>? getObjects() {
    return box?.values.toList() as List<Account>;
  }

  @override
  Future<void> putObject(Account object) async {
    await box?.putAt(0, object);
  }
}
