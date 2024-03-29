import 'package:easy_wallet_v2/core/theme/color/wallet_colors.dart';
import 'package:easy_wallet_v2/core/theme/text/text_theme.dart';
import 'package:easy_wallet_v2/core/theme/wallet_light_theme.dart';
import 'package:easy_wallet_v2/product/constants/wallet_strings.dart';
import 'package:easy_wallet_v2/product/utils/asset_helper.dart';
import 'package:easy_wallet_v2/product/utils/widget_state_controllers.dart';

abstract class BaseSingleton {
  AssetHelper get assetHelper => AssetHelper.instance;
  WalletColors get walletColors => WalletColors.instance;
  WalletLightTextTheme get walletTextTheme => WalletLightTextTheme.instance;
  WalletLightTheme get walletLightTheme => WalletLightTheme.instance;
  WidgetStateControllers get widgetStateControllers =>
      WidgetStateControllers.instance;
  WalletStrings get walletStrings => WalletStrings.instance;
}
