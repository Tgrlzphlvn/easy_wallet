import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_dropdown_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_account_page_view_model.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddAccountPage extends StatelessWidget with BaseSingleton {
  AddAccountPage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.addAccount),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: context.paddingAllHigh,
            child: LottieHelper.showLottie(
              LottieEnum.walletSettings,
              lottieHeight: context.heightGenerator(0.18),
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: WalletTextFormField(
              icon: Icons.wallet,
              label: LocalizationHelper.accountName,
              controller: _accountNameController,
              keyboardType: TextInputType.name,
              action: TextInputAction.next,
              nextFocusValue: 24,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                LengthLimitingTextInputFormatter(24),
              ],
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: WalletTextFormField(
              icon: Icons.person_outline,
              label: LocalizationHelper.accountHolderName,
              controller: _accountNameController,
              keyboardType: TextInputType.name,
              action: TextInputAction.next,
              nextFocusValue: 24,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                LengthLimitingTextInputFormatter(24),
              ],
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: WalletTextFormField(
              icon: Icons.numbers,
              label: LocalizationHelper.accountNumber,
              controller: _controller,
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
              nextFocusValue: 16,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
            ),
          ),
          Padding(
            padding: context.walletCardWidgetsPaddingHigh,
            child: _currencyUnitDropDownButtonRow(context),
          ),
          Padding(
            padding: context.paddingAllHigh,
            child: WalletOutlineButton(
              title: LocalizationHelper.saveAccount,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Row _currencyUnitDropDownButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocalizationHelper.chooseCurrency),
        WalletDropDownButton<CurrencyUnit>(
          value: Provider.of<AddAccountPageViewModel>(context).chosenCurrecyUnit,
          onChanged: (value) {
            Provider.of<AddAccountPageViewModel>(context, listen: false)
                .changeCurrencyUnit(value!);
          },
          items: CurrencyUnit.values
              .map<DropdownMenuItem<CurrencyUnit>>(
                (value) => DropdownMenuItem(
                  value: value,
                  child:
                      Text(value.name, style: walletTextTheme.textTheme.bodyText1),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
