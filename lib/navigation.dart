import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Simple static class to aggregate navigation
class Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static beforeNavigate() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static toInfo({
    Videocard videocard
  }) {
    beforeNavigate();
    navigatorKey.currentState.push(
      MaterialPageRoute(builder: (context) =>
        InfoScreen(
          videocard: videocard,
        )
      )
    );
  }
}