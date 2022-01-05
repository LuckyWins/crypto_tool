import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

// ignore: avoid_classes_with_only_static_members
/// Simple static class to aggregate navigation
class Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();

  static void beforeNavigate() {
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }

  static void toInfo({
    required Videocard videocard
  }) {
    beforeNavigate();
    navigatorKey.currentState!.push(
      MaterialPageRoute<void>(builder: (context) =>
        InfoScreen(
          videocard: videocard,
        )
      )
    );
  }

  static Future<bool?> toSettings() {
    beforeNavigate();
    return navigatorKey.currentState!.push<bool>(
      MaterialPageRoute(builder: (context) =>
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc()..add(SettingsInit()),
          child: SettingsScreen()
        )
      )
    );
  }

  static void toHome() {
    beforeNavigate();
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute<void>(builder: (context) =>
        const HomeScreen()
      )
    );
  }

  static void toCalculator() {
    beforeNavigate();
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute<void>(builder: (context) =>
        CalculatorScreen()
      )
    );
  }
}