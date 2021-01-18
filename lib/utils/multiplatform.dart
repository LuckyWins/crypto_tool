import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Multiplatform {

  static bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  static const TextTheme iosTextTheme = Typography.blackCupertino;

  static Future<T> showDropdown<T>({
    @required BuildContext context,
    Map<T, String> map,
    T selected,
    String title
  }) {
    if (isIOS) {
      return showCupertinoModalPopup<T>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: title != null
              ? Text(title)
              : null,
          actions: map.map((key, description)  => MapEntry(key,
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(key),
              child: Text(
                description ?? "",
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontWeight: selected == key
                      ? FontWeight.bold
                      : FontWeight.normal
                )
              ),
              // isDestructiveAction: e.isDestructive,
            )
          )).values.toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              "Отмена",
              style: TextStyle(
                color: CupertinoColors.systemRed
              )
            ),
          ),
        )
      );
    } else {
      return showDialog<T>(
        context: context,
        builder: (context) => SimpleDialog(
          title: title != null
              ? Text(
                title,
                style: TextStyle(
                  fontSize: 18
                ),
              )
              : null,
          children: map.map((key, description) => MapEntry(key,
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, key),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: selected == key
                        ? FontWeight.bold
                        : FontWeight.normal
                  ),
                ),
              ),
            )
          )).values.toList(),
        )
      );
    }
  }

}