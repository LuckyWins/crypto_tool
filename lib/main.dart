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
        create: (context) => HomeBloc()..add(HomeInit())
      )
    ],
    child: CryptoToolApp()
  ));
}

class CryptoToolApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        RefreshLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru'),
        //const Locale('en'),
      ],
      title: 'Crypto Tool',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppStyles.scaffoldColor,
        appBarTheme: AppBarTheme(
          color: AppStyles.scaffoldColor,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: AppStyles.mainColor
          )
        ),
        primarySwatch: Colors.deepPurple,
        secondaryHeaderColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppStyles.mainTextColor
        ),
        primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
          bodyColor: AppStyles.mainTextColor
        ),
      ),
      home: HomeScreen(),
    );
  }
}