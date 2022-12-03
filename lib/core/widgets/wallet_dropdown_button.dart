import 'package:flutter/material.dart';

class WalletDropDownButton<T> extends StatelessWidget {
  const WalletDropDownButton({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.items,
  }) : super(key: key);

  final void Function(T?) onChanged;
  final T value;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      borderRadius: BorderRadius.circular(20),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
