import 'package:flutter/material.dart';

class CryptoDrawerHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CryptoDrawerHeader({
    @required this.title,
    @required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w400
              ),
            )
          ]
        ),
      ),
    );
  }
}