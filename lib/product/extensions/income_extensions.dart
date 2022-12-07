import 'package:easy_wallet_v2/feature/model/account.dart';

extension IncomeExtension on Income {
  String getDayMonthYear() {
    return '${createdTime.day}.${createdTime.month}.${createdTime.year}';
  }

  String getMonthYear() {
    return '${createdTime.month}.${createdTime.year}';
  }
}
