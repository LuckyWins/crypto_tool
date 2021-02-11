import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class UsdProfit extends StatelessWidget {
  final double usd;

  const UsdProfit(this.usd);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.attach_money,
          color: AppStyles.mainTextColor,
        ),
        Text(
          "$usd",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ],
    );
  }
}