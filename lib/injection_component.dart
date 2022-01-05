// import 'package:alice/alice.dart';
import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';
import 'package:logger/logger.dart';

class InjectionComponent {
  static final InjectionComponent _singleton = InjectionComponent._internal();
  // Use this static instance
  static final Injector injector = Injector.appInstance;

  factory InjectionComponent() => _singleton;

  InjectionComponent._internal();

  static Future<void> run() async {
    //Inject all
    injector
    ..registerSingleton<Dio>(() {
      final dio = Dio();
      dio.options.connectTimeout = 25000;
      dio.options.receiveTimeout = 25000;

      // inject debug dependency
      if (kDebugMode) {
        final logger = Logger();
        // var alice =  Alice(showNotification: false, showInspectorOnShake: true, darkTheme: true)..setNavigatorKey(Navigation.navigatorKey);
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            // logger.i(options.uri);
            logger
              ..i('REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}\nquery${options.queryParameters}\nAUTH: ${options.headers["Authorization"]}')
              ..i(options.data);
            return handler.next(options);
          },
          onResponse: (response, handler) {
            logger.i(response.data);
            return handler.next(response);
          },
          onError: (e, handler) {
            logger
              ..e('${e.message}\n\n${e.response?.data}')
              ..e(e.response?.data);
            return handler.next(e);
          }
        ));

        // dio.interceptors.add(alice.getDioInterceptor());
      }

      return dio;
    })
    ..registerSingleton<DataManager>(() {
      final dio = injector.get<Dio>();
      return DataManager(dio);
    })
    ..registerSingleton<PreferencesHelper>(() => PreferencesHelper());
  }

  static T getDependency<T>() => injector.get<T>();
  
}