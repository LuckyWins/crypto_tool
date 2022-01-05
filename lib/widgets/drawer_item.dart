import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String text;
  final Function() onTap;

  const DrawerItem({
    required this.selected,
    required this.icon,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      leading: Icon(
        icon,
        size: 28,
        color: selected
              ? AppStyles.mainColor
              : null,
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