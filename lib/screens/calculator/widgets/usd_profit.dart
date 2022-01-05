import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class UsdProfit extends StatelessWidget {
  final double usd;

  const UsdProfit(this.usd);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(
        Icons.attach_money,
        color: AppStyles.mainTextColor,
      ),
      Text(
        '$usd',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    ],
  );
}