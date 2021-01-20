import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParamSwitch extends StatelessWidget {
  final bool value;
  final String text;
  final Function(bool value) onTap;

  const ParamSwitch({
    @required this.value,
    @required this.text,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(!value),
      title: Text(text ?? ""),
      trailing: CupertinoSwitch(
        activeColor: AppStyles.mainColor,
        value: value,
        onChanged: (it) => onTap?.call(it),
      ),
    );
  }
}