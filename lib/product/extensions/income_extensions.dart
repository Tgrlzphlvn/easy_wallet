import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';

extension IncomeExtension on Income {
  String getDayMonthYear() {
    return '${createdTime.day}.${createdTime.month}.${createdTime.year}';
  }

  String getMonthYear() {
    return '${createdTime.month}.${createdTime.year}';
  }

  IconData incomeIconSelector(IncomeTypes incomeTypes) {
    switch (incomeTypes) {
      case IncomeTypes.salary:
        return Icons.monetization_on_outlined;
      case IncomeTypes.freelanceIncome:
        return Icons.military_tech_outlined;
      case IncomeTypes.eTrade:
        return Icons.trending_up_outlined;
      case IncomeTypes.realEstateIncome:
        return Icons.real_estate_agent_outlined;
      case IncomeTypes.tradeIncome:
        return Icons.currency_exchange;
      case IncomeTypes.other:
        return Icons.work_outline_sharp;
    }
  }
}
