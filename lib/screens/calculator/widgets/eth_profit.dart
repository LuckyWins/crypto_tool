import 'package:flutter/material.dart';

class EthProfit extends StatelessWidget {
  final double eth;

  const EthProfit(this.eth);

  @override
  Widget build(BuildContext context) => Text(
    '$eth ETH',
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16
    ),
  );
}