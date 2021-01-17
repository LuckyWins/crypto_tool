import 'package:dio/dio.dart';

import 'data.dart';

class DataManager {
  OnlinerApi _onlinerApi;
  final Dio dio;

  DataManager(this.dio) {
    _onlinerApi = OnlinerApi(dio);
  }

  Future<String> getVideocard() {
    return _onlinerApi.testRequest();
  }
}