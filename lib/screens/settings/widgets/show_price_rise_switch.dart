import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPriceRiseSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onTap;

  const ShowPriceRiseSwitch({
    @required this.value,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(!value),
      title: Text("Отображать рыночную цену"),
      trailing: CupertinoSwitch(
        activeColor: AppStyles.mainColor,
        value: value,
        onChanged: (it) => onTap?.call(it),
      ),
    );
  }
}