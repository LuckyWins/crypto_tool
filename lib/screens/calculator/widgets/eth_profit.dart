import 'package:flutter/material.dart';

class EthProfit extends StatelessWidget {
  final double eth;

  const EthProfit(this.eth);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$eth ETH",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
    );
  }
}