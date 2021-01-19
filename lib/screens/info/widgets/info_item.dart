import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoItem({
    @required this.title,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              fontSize: 16
            ),
          ),
          if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: AppStyles.mainTextColor.withOpacity(0.5)
                  ),
                ),
              ),
        ],
      ),
    );
  }
}