import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItemSvg extends StatelessWidget {
  final bool selected;
  final String assetName;
  final String text;
  final Function() onTap;

  const DrawerItemSvg({
    required this.selected,
    required this.assetName,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      leading: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: SvgPicture.asset(
          'assets/icon/$assetName.svg',
          width: 24,
          height: 24,
          semanticsLabel: text,
          color: selected
              ? AppStyles.mainColor
              : Colors.grey[700],
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: selected
              ? AppStyles.mainColor
              : AppStyles.mainTextColor,
          // fontSize: 14
        ),
      ),
      onTap: onTap,
    );
  }
}