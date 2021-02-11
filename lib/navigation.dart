import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

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

  static Future<bool> toSettings() {
    beforeNavigate();
    return navigatorKey.currentState.push<bool>(
      MaterialPageRoute(builder: (context) =>
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc()..add(SettingsInit()),
          child: SettingsScreen()
        )
      )
    );
  }

  static toHome() {
    beforeNavigate();
    navigatorKey.currentState.pushReplacement(
      MaterialPageRoute(builder: (context) =>
        HomeScreen()
      )
    );
  }

  static toCalculator() {
    beforeNavigate();
    navigatorKey.currentState.pushReplacement(
      MaterialPageRoute(builder: (context) =>
        CalculatorScreen()
      )
    );
  }
}