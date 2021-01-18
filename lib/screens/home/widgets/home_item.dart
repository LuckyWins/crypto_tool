import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final Videocard videocard;

  const HomeItem(this.videocard);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            videocard.gpuName,
            style: TextStyle(
              color: AppStyles.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          // SizedBox(height: 2),
          Text(
            // "\$ ${videocard.minPrice} - ${videocard.maxPrice}",
            "\$${videocard.minPrice}",
            style: TextStyle(
              color: AppStyles.mainTextColor,

            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: "${videocard.hashRate}",
              style: TextStyle(
                color: AppStyles.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              children: [
                TextSpan(
                  text: " MH/S",
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                  ),
                )
              ]
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: "${(videocard.dailyInBtc * 1000).toStringAsFixed(8)}",
              style: TextStyle(
                color: AppStyles.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              children: [
                TextSpan(
                  text: " mBTC / Day",
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                  ),
                ),
                TextSpan(
                  text: " ~ \$${videocard.dailyInUsd.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: AppStyles.mainTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}