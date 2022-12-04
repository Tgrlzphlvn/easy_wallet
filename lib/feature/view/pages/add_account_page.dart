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

  final GlobalKey _key = GlobalKey();

  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountHolderNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.addAccount),
      ),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Column(
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
                child: _accountNameTextFormField(),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: _accountHolderNameTextFormField(),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: _accountNumberTextFormField(),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: _currencyUnitDropDownButtonRow(context),
              ),
              Padding(
                padding: context.paddingAllHigh,
                child: WalletOutlineButton(
                  title: LocalizationHelper.saveAccount,
                  onPressed: () async {
                    await Provider.of<AddAccountPageViewModel>(context, listen: false)
                        .addAccount(
                      Account.create(
                        accountName: _accountNameController.text,
                        accounHolderName: _accountHolderNameController.text,
                        accountNumber: _accountNumberController.text,
                        currencyUnit: Provider.of<AddAccountPageViewModel>(context,
                                listen: false)
                            .chosenCurrecyUnit,
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 1));
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  WalletTextFormField _accountNameTextFormField() {
    return WalletTextFormField(
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
    );
  }

  WalletTextFormField _accountHolderNameTextFormField() {
    return WalletTextFormField(
      icon: Icons.person_outline,
      label: LocalizationHelper.accountHolderName,
      controller: _accountHolderNameController,
      keyboardType: TextInputType.name,
      action: TextInputAction.next,
      nextFocusValue: 24,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(24),
      ],
    );
  }

  WalletTextFormField _accountNumberTextFormField() {
    return WalletTextFormField(
      icon: Icons.numbers,
      label: LocalizationHelper.accountNumber,
      controller: _accountNumberController,
      keyboardType: TextInputType.number,
      action: TextInputAction.done,
      nextFocusValue: 5,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(5),
      ],
    );
  }

  Row _currencyUnitDropDownButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocalizationHelper.chooseCurrency,
          style: walletTextTheme.textTheme.bodyText1,
        ),
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
