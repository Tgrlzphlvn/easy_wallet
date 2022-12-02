import 'package:easy_localization/easy_localization.dart';

class LocalizationHelper {
  static LocalizationHelper? _instance;
  static LocalizationHelper get instance {
    _instance ??= LocalizationHelper._init();
    return _instance!;
  }

  LocalizationHelper._init();

  final String appTitle = 'easy_wallet'.tr();
  final String currentBalance = 'current_balance'.tr();
  final String wallet = 'wallet'.tr();
  final String settings = 'settings'.tr();
}
