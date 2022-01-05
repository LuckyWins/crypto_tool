import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/navigation.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final Videocard videocard;
  final bool showPriceRise;
  final bool includeElectricityCost;

  const HomeItem({
    required this.videocard,
    required this.showPriceRise,
    required this.includeElectricityCost,
  });
  
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      Navigation.toInfo(
        videocard: videocard
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            videocard.gpuName,
            style: const TextStyle(
              color: AppStyles.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          // SizedBox(height: 2),
          RichText(
            text: TextSpan(
              // "\$ ${videocard.minPrice} - ${videocard.maxPrice}",
              text: videocard.minPrice == 0.0 ? 'Нет в продаже' : '\$${videocard.minPrice}',
              style: const TextStyle(
                color: AppStyles.mainTextColor,
              ),
              children: [
                if (showPriceRise)
                TextSpan(
                  text: '     \$${videocard.expectedPrice}',
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5),
                    fontSize: 12
                  )
                ),
                if (showPriceRise && videocard.priceRise != 0.0)
                  TextSpan(
                    text: '  ${videocard.priceRise.isNegative ? "-" : "+"}${videocard.priceRise}%',
                    style: TextStyle(
                      // color: AppStyles.mainTextColor.withOpacity(0.5),
                      color: videocard.priceRise.isNegative
                        ? CupertinoColors.systemGreen
                        : CupertinoColors.systemRed,
                      fontSize: 12
                    )
                  ),
              ]
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: '${videocard.hashRate}',
              style: const TextStyle(
                color: AppStyles.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              children: [
                TextSpan(
                  text: ' MH/S',
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                  ),
                )
              ]
            ),
          ),
          const SizedBox(height: 8),
          // RichText(
          //   text: TextSpan(
          //     text: "${(videocard.revenueDailyInBtc * 1000).toStringAsFixed(8)}",
          //     style: TextStyle(
          //       color: AppStyles.mainTextColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16
          //     ),
          //     children: [
          //       TextSpan(
          //         text: " mBTC / Day",
          //         style: TextStyle(
          //           color: AppStyles.mainTextColor.withOpacity(0.5),
          //           fontWeight: FontWeight.normal,
          //           fontSize: 12
          //         ),
          //       ),
          //       TextSpan(
          //         text: " ~ \$${videocard.revenueDailyInUsd.toStringAsFixed(2)}",
          //         style: TextStyle(
          //           color: AppStyles.mainTextColor,
          //           fontWeight: FontWeight.normal,
          //           fontSize: 14
          //         ),
          //       )
          //     ]
          //   ),
          // ),
          RichText(
            text: TextSpan(
              text: includeElectricityCost
                ? '\$${videocard.profitDailyInUsd.toStringAsFixed(2)}'
                : '\$${videocard.revenueDailyInUsd.toStringAsFixed(2)}',
              style: const TextStyle(
                color: AppStyles.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              children: [
                TextSpan(
                  text: includeElectricityCost
                    ? ' Прибыль'
                    : ' Доход',
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                  ),
                ),
              ]
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: videocard.paybackRateColor(includeElectricityCost),
                  borderRadius: BorderRadius.circular(4)
                ),
                padding: const EdgeInsets.all(4),
                child: Text('${videocard.paybackDays(includeElectricityCost) == 0 ? "-" : videocard.paybackDays(includeElectricityCost)} дней'),
              ),
              const SizedBox(width: 4),
              Text(
                'Окупаемость',
                style: TextStyle(
                  color: AppStyles.mainTextColor.withOpacity(0.5),
                  fontSize: 12
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}