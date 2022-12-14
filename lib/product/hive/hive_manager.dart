import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveManager<T> {
  Box? box;
  String key;

  HiveManager(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox<T>(key);
    } else {
      box = Hive.box<T>(key);
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> addObject(T object);
  Future<void> deleteObject(T object);
  List<T>? getObjects();
}
