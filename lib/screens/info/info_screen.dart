import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/widgets.dart';

class InfoScreen extends StatelessWidget {
  final Videocard videocard;

  const InfoScreen({
    @required this.videocard
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(videocard.gpuName),
        actions: [
          if (videocard.pricesUrl != null)
            OnlinerButton(
              onPressed: () => launch(videocard.pricesUrl),
            )
        ],
      ),
      body: FullScreen(
        topSafe: false,
        bottomSafe: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoItem(
                title: videocard.gpuDescription,
              ),
              SizedBox(height: 16),
              InfoItem(
                title: "Среднее энергопотребление",
                subtitle: "${videocard.powerUsage} W",
              ),
              InfoItem(
                title: "Текущая цена",
                subtitle: "${videocard.minPrice == 0.0 ? "Нет в продаже" : "\$${videocard.minPrice}" }"
              ),
              InfoItem(
                title: "Рыночная цена",
                subtitle: "\$${videocard.expectedPrice}",
              ),
              InfoItem(
                title: "ETH",
                subtitle: "${videocard.hashRate} MH/S",
              ),
              InfoItem(
                title: "BTC",
                subtitle: "${(videocard.revenueDailyInBtc * 1000).toStringAsFixed(8)} mBTC/Day",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  Widget body = Container();
                  if (state is HomeLoaded) {
                    if (state.includeElectricityCost) {
                      body = InfoItem(
                        title: "Электроэнергия, день/месяц/год",
                        subtitle: "\$${videocard.electricityExpensesDaily.toStringAsFixed(2)}  \$${(videocard.electricityExpensesDaily*30)}  \$${(videocard.electricityExpensesDaily*365).toStringAsFixed(2)}",
                      );
                    }
                  }
                  return body;
                }
              ),
              InfoItem(
                title: "Доход, день/месяц/год",
                subtitle: "\$${videocard.revenueDailyInUsd.toStringAsFixed(2)}  \$${(videocard.revenueDailyInUsd * 30).toStringAsFixed(2)}  \$${(videocard.revenueDailyInUsd * 365).toStringAsFixed(2)}",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  Widget body = Container();
                  if (state is HomeLoaded) {
                    if (state.includeElectricityCost) {
                      body = InfoItem(
                        title: "Прибыль, день/месяц/год",
                        subtitle: "\$${videocard.profitDailyInUsd.toStringAsFixed(2)}  \$${(videocard.profitDailyInUsd*30).toStringAsFixed(2)}  \$${(videocard.profitDailyInUsd*365).toStringAsFixed(2)}",
                      );
                    }
                  }
                  return body;
                }
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  Widget body = Container();
                  if (state is HomeLoaded) {
                    body = InfoItem(
                        title: "Окупаемость",
                        subtitle: "${videocard.paybackDays(state.includeElectricityCost) == 0.0 ? "-" : videocard.paybackDays(state.includeElectricityCost)} дней",
                      );
                  }
                  return body;
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}