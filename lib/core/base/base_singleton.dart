import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/theme/color/wallet_colors.dart';
import 'package:easy_wallet_v2/core/theme/text/text_theme.dart';
import 'package:easy_wallet_v2/core/theme/wallet_light_theme.dart';
import 'package:easy_wallet_v2/product/utils/asset_helper.dart';

abstract class BaseSingleton {
  AssetHelper get assetHelper => AssetHelper.instance;
  WalletColors get walletColors => WalletColors.instance;
  WalletLightTextTheme get walletTextTheme => WalletLightTextTheme.instance;
  WalletLightTheme get walletLightTheme => WalletLightTheme.instance;
  LocalizationHelper get localizationHelper => LocalizationHelper.instance;
}
