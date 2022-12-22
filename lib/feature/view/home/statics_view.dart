import 'package:easy_wallet_v2/core/base/base_singleton.dart';
import 'package:easy_wallet_v2/core/localization/localization_helper.dart';
import 'package:easy_wallet_v2/core/widgets/statistics_card.dart';
import 'package:easy_wallet_v2/feature/viewmodel/statistics_view_model.dart';
import 'package:easy_wallet_v2/product/extensions/ui_settings_extensions.dart';
import 'package:easy_wallet_v2/product/utils/lottie_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaticsView extends StatelessWidget with BaseSingleton {
  const StaticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readProvider = Provider.of<StatisticViewModel>(context, listen: false);
    final listenProvider = Provider.of<StatisticViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.statistics),
      ),
      body: listenProvider.incomes.isEmpty && listenProvider.expenses.isEmpty
          ? Center(child: LottieHelper.showLottie(LottieEnum.cat))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: context.paddingAllLow,
                    child: listenProvider.incomes.isEmpty
                        ? LottieHelper.showLottie(LottieEnum.emptyList)
                        : StatisticsCard(
                            title: 'En yüksek gelirler',
                            incomes: readProvider.incomes,
                          ),
                  ),
                  Padding(
                    padding: context.paddingAllLow,
                    child: listenProvider.expenses.isEmpty
                        ? LottieHelper.showLottie(LottieEnum.emptyList)
                        : StatisticsCard(
                            title: 'En yüksek giderler',
                            expenses: readProvider.expenses,
                          ),
                  )
                ],
              ),
            ),
    );
  }
}
