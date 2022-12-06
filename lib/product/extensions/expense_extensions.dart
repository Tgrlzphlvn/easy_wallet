import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';

extension ExpenseExtension on Expense {
  String getDayMonthYear() {
    return '${createdTime.day}.${createdTime.month}.${createdTime.year}';
  }

  String getMonthYear() {
    return '${createdTime.month}.${createdTime.year}';
  }
}
