import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';

class EthRate extends StatelessWidget {
  final double eth;
  final double changePercentage;

  const EthRate({
    required this.eth,
    required this.changePercentage
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        'ETH/USD',
        style: TextStyle(
          color: AppStyles.mainTextColor.withOpacity(0.5)
        ),
      ),
      const SizedBox(height: 2),
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$eth',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${changePercentage.isNegative ? "" : "+"}$changePercentage%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: changePercentage.isNegative
                  ? CupertinoColors.systemRed
                  : CupertinoColors.systemGreen,
            ),
          ),
        ],
      ),
    ],
  );
}