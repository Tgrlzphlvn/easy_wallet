import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_dropdown_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_outline_button.dart';
import 'package:easy_wallet_v2/core/widgets/wallet_text_form_field.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:easy_wallet_v2/feature/model/reporters.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_income_or_expense_view_model.dart.dart';
import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddIncomeOrExpensePage extends StatelessWidget with BaseSingleton {
  AddIncomeOrExpensePage({Key? key, required this.incomeOrExpense})
      : super(key: key);

  final Reporter incomeOrExpense;

  final TextEditingController _nameTextFieldController = TextEditingController();
  final TextEditingController _amountTextFieldController = TextEditingController();

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Account _account =
        Provider.of<HomeViewModel>(context, listen: false).accounts[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.addIncomeOrExpenseTitle),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: context.paddingAllHigh,
                child: LottieHelper.showLottie(
                  LottieEnum.walletman,
                  lottieHeight: context.heightGenerator(0.18),
                ),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: WalletTextFormField(
                  controller: _nameTextFieldController,
                  keyboardType: TextInputType.name,
                  action: TextInputAction.next,
                  inputFormatters: [LengthLimitingTextInputFormatter(24)],
                  label: LocalizationHelper.name,
                  icon: Icons.text_snippet_outlined,
                  nextFocusValue: 24,
                ),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: WalletTextFormField(
                  controller: _amountTextFieldController,
                  keyboardType: TextInputType.number,
                  action: TextInputAction.done,
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  label: LocalizationHelper.amount,
                  icon: Icons.numbers,
                  nextFocusValue: 16,
                ),
              ),
              Padding(
                padding: context.walletCardWidgetsPaddingHigh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalizationHelper.chooseType,
                      style: walletTextTheme.textTheme.bodyText1,
                    ),
                    _incomeOrExpenseDropDownButton(context),
                  ],
                ),
              ),
              Padding(
                padding: context.paddingAllHigh,
                child: WalletOutlineButton(
                  title: LocalizationHelper.save,
                  onPressed: () async {
                    Provider.of<AddIncomeOrExpenseViewModel>(context, listen: false)
                        .addIncomeOrExpense(
                      Account(
                        accountName: _account.accountName,
                        accounHolderName: _account.accounHolderName,
                        accountNumber: _account.accountNumber,
                        currencyUnit: _account.currencyUnit,
                        expenses: incomeOrExpense.isThis == true
                            ? _account.expenses +
                                [
                                  Expense(
                                      Provider.of<AddIncomeOrExpenseViewModel>(
                                              context,
                                              listen: false)
                                          .chosenExpenseType,
                                      _nameTextFieldController.text,
                                      int.parse(_amountTextFieldController.text))
                                ]
                            : _account.expenses,
                        income: incomeOrExpense.isThis == false
                            ? _account.income +
                                [
                                  Income(
                                    _nameTextFieldController.text,
                                    Provider.of<AddIncomeOrExpenseViewModel>(context,
                                            listen: false)
                                        .chosenIncomeType,
                                    int.parse(_amountTextFieldController.text),
                                  ),
                                ]
                            : _account.income,
                      ),
                    );
                    Provider.of<HomeViewModel>(context, listen: false).getAccounts();
                    Provider.of<HomeViewModel>(context, listen: false).getIncomes();
                    Provider.of<HomeViewModel>(context, listen: false).getExpenses();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  WalletDropDownButton _incomeOrExpenseDropDownButton(BuildContext context) {
    if (incomeOrExpense.isThis == true) {
      return WalletDropDownButton<ExpenseProductTypes>(
        onChanged: (value) {
          Provider.of<AddIncomeOrExpenseViewModel>(context, listen: false)
              .changeExpenseType(value ?? ExpenseProductTypes.other);
        },
        value: Provider.of<AddIncomeOrExpenseViewModel>(context).chosenExpenseType,
        items: ExpenseProductTypes.values
            .map<DropdownMenuItem<ExpenseProductTypes>>(
              (expense) => DropdownMenuItem(
                value: expense,
                child: Text(
                  expense.name,
                  style: walletTextTheme.textTheme.bodyText1,
                ),
              ),
            )
            .toList(),
      );
    } else {
      return WalletDropDownButton<IncomeTypes>(
        onChanged: (value) {
          Provider.of<AddIncomeOrExpenseViewModel>(context, listen: false)
              .changeIncomeType(value ?? IncomeTypes.other);
        },
        value: Provider.of<AddIncomeOrExpenseViewModel>(context).chosenIncomeType,
        items: IncomeTypes.values
            .map<DropdownMenuItem<IncomeTypes>>(
              (income) => DropdownMenuItem(
                value: income,
                child: Text(
                  income.name,
                  style: walletTextTheme.textTheme.bodyText1,
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
