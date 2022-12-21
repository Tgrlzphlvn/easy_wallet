import 'package:easy_localization/easy_localization.dart';
import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/feature/model/account.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticChart extends StatelessWidget with BaseSingleton {
  StatisticChart({Key? key, this.income, this.expense, required this.account})
      : super(key: key);

  final List<Income>? income;
  final List<Expense>? expense;
  final Account account;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return expense == null
        ? SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(fontSize: 8, color: walletColors.eerieBlack),
            ),
            primaryYAxis: NumericAxis(
              labelStyle: TextStyle(fontSize: 8, color: walletColors.eerieBlack),
              rangePadding: ChartRangePadding.none,
              numberFormat: NumberFormat.compact(),
            ),
            series: <CartesianSeries>[
              ColumnSeries<Income, String>(
                dataSource: income ?? [],
                xValueMapper: (data, index) => data.incomeName,
                yValueMapper: (data, index) => data.amount,
                color: walletColors.morningBlue,
                name: 'Income',
              ),
            ],
          )
        : SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(fontSize: 8, color: walletColors.eerieBlack),
            ),
            primaryYAxis: NumericAxis(
              labelStyle: TextStyle(fontSize: 8, color: walletColors.eerieBlack),
              rangePadding: ChartRangePadding.none,
              numberFormat: NumberFormat.compact(),
            ),
            series: <CartesianSeries>[
              ColumnSeries<Expense, String>(
                dataSource: expense ?? [],
                xValueMapper: (data, index) => data.productName,
                yValueMapper: (data, index) => data.amount,
                color: walletColors.bittersweetShimmer,
                name: 'Expense',
              )
            ],
          );
  }
}
