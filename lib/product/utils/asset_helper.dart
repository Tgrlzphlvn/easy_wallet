import 'package:easy_wallet_v2/product/enums/asset_helper_enum.dart';

class AssetHelper {
  static AssetHelper? _instance;
  static AssetHelper get instance {
    _instance ??= AssetHelper._init();
    return _instance!;
  }

  AssetHelper._init();

  String getPaymetSystemLogoPNG(AssetHelperEnum asset) {
    return 'assets/logo/${asset.name}.png';
  }

  String localizationPath = 'assets/translations';
}
