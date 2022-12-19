import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/product/utils/wallet_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletTextFormField extends StatelessWidget with BaseSingleton {
  const WalletTextFormField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.action,
      required this.inputFormatters,
      required this.label,
      required this.icon,
      required this.nextFocusValue})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final List<TextInputFormatter> inputFormatters;
  final String label;
  final IconData icon;
  final int nextFocusValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
      ),
      style: walletTextTheme.textTheme.bodyText1,
      controller: controller,
      keyboardType: keyboardType,
      textAlign: TextAlign.start,
      textInputAction: action,
      inputFormatters: inputFormatters,
      validator: (value) {
        WalletValidators.instance.nullCheck(value);
        WalletValidators.instance.mockNameController(value);
      },
      onChanged: (value) {
        if (value.length == nextFocusValue) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty) {
          FocusScope.of(context).previousFocus();
        }
      },
    );
  }
}
