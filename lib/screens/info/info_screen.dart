import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/styles.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
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
                subtitle: "${(videocard.dailyInBtc * 1000).toStringAsFixed(8)} mBTC/Day",
              ),
              InfoItem(
                title: "Прибыль",
                subtitle: "~ \$${videocard.dailyInUsd.toStringAsFixed(2)}",
              ),
              InfoItem(
                title: "Окупаемость",
                subtitle: "${videocard.paybackDays == 0.0 ? "-" : videocard.paybackDays} дней",
              ),
            ],
          ),
        ),
      ),
    );
  }
}