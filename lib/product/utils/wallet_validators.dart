import 'package:easy_wallet_v2/core/localization/localization_helper.dart';

class WalletValidators {
  static WalletValidators? _instance;
  static WalletValidators get instance {
    _instance ??= WalletValidators._init();
    return _instance!;
  }

  WalletValidators._init();

  String? nullCheck(String? value) {
    if (value == null) {
      return LocalizationHelper.cannotEmpty;
    }
    return null;
  }

  String? mockNameController(String? value) {
    if(value == 'mockmockmockmock321') {
      return '';
    }
    return null;
  }
}
