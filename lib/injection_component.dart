// import 'package:alice/alice.dart';
import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';
import 'package:logger/logger.dart';

import 'navigation.dart';

class InjectionComponent {
  static final InjectionComponent _singleton = new InjectionComponent._internal();
  // Use this static instance
  static final Injector injector = Injector.appInstance;

  factory InjectionComponent() {
    return _singleton;
  }

  InjectionComponent._internal();

  static Future<void> run() async {
    //Inject all
    injector.registerSingleton<Dio>(() {
      var dio = Dio();
      dio.options.connectTimeout = 25000;
      dio.options.receiveTimeout = 25000;

      // inject debug dependency
      if (kDebugMode) {
        var logger = Logger();
        // var alice =  Alice(showNotification: false, showInspectorOnShake: true, darkTheme: true)..setNavigatorKey(Navigation.navigatorKey);
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            //logger.i(options.uri);
            logger.i(options.data);
            return options;
          },
          onResponse: (Response response) async {
            logger.i(response.data);
            return response;
          },
          onError: (DioError e) async {
            logger.e(e.message);
            return e;
          }
        ));

        // dio.interceptors.add(alice.getDioInterceptor());
      }

      return dio;
    });
    
    injector.registerSingleton<DataManager>(() {
      var dio = injector.get<Dio>();
      return DataManager(dio);
    });

    injector.registerSingleton<PreferencesHelper>(() => PreferencesHelper());
  }

  static T getDependency<T>() {
    return injector.get<T>();
  }
  
}