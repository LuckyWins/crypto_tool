import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/navigation.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  static showMessage({
    @required BuildContext context,
    @required String title,
    @required String message,
    DialogType type = DialogType.error
  }) {
    String iconName;
    switch (type) {
      case DialogType.error:
        iconName = "dialog_error";
        break;
      case DialogType.success:
        iconName = "dialog_success";
        break;
      case DialogType.info:
        iconName = "dialog_info";
        break;
    }

    Widget dialogChild = IntrinsicWidth(
      stepWidth: 56.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (title != null)
                  Padding(
                    padding: EdgeInsets.fromLTRB(36, 40, 36, 8),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppStyles.mainTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4
                        ),
                      ),
                    ),
                  ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(36, 0, 36, 16),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppStyles.mainTextColor.withOpacity(0.5),
                        fontSize: 16,
                        // fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigation.navigatorKey.currentState.pop(),
                  icon: SvgPicture.asset('assets/icon/dialog_close.svg'),
                ),
              ],
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets + (EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0));
        return AnimatedPadding(
          padding: effectivePadding,
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Center(
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 33),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 280),
                          child: SizedBox(
                            width: 100,
                            child: Material(
                              color: Colors.white,
                              elevation: 24.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                              type: MaterialType.card,
                              clipBehavior: Clip.none,
                              child: dialogChild,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/icon/$iconName.svg'),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}