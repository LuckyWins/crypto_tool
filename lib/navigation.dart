import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Simple static class to aggregate navigation
class Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static beforeNavigate() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static toAuth() {
    beforeNavigate();
    // navigatorKey.currentState.pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) =>
    //     AuthScreen(),
    //     // settings: RouteSettings(isInitialRoute: true)
    //   ),
    //   (route) => false
    // );
  }
}