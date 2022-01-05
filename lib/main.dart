import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'blocs/bloc_observer.dart';
import 'blocs/blocs.dart';
import 'injection_component.dart';
import 'navigation.dart';
import 'screens/screens.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  InjectionComponent.run();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()
      ),
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc()
      )
    ],
    child: CryptoToolApp()
  ));
}

class CryptoToolApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    navigatorKey: Navigation.navigatorKey,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      RefreshLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ru'),
      //const Locale('en'),
    ],
    title: 'Crypto Tool',
    theme: ThemeData(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppStyles.scaffoldColor,
      appBarTheme: AppBarTheme(
        color: AppStyles.scaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        // toolbarTextStyle: TextStyle(
        //   color: AppStyles.mainTextColor
        // ),
        iconTheme: Theme.of(context).primaryIconTheme.copyWith(
          color: AppStyles.mainColor
        )
      ),
      primarySwatch: Colors.blue,
      secondaryHeaderColor: Colors.black,
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppStyles.mainTextColor
      ),
      primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
        bodyColor: AppStyles.mainTextColor
      ),
    ),
    home: const HomeScreen(),
  );
}