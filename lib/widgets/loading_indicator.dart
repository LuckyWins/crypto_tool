import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  
  LoadingIndicator({
    Key key,
    Color color = AppStyles.mainColor
  }) : color = color, super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    return isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(
          valueColor:
          AlwaysStoppedAnimation<Color>(color),
        );
  }
}