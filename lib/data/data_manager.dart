import 'package:dio/dio.dart';

import 'data.dart';

class DataManager {
  OnlinerApi _onlinerApi;
  NbrbApi _nbrbApi;
  EtherchainApi _etherchainApi;
  final Dio dio;

  DataManager(this.dio) {
    _onlinerApi = OnlinerApi(dio);
    _nbrbApi = NbrbApi(dio);
    _etherchainApi = EtherchainApi(dio);
  }

  Future<VideoCardResponse> getVideocard(String gpuName) {
    return _onlinerApi.videocardRequest(gpuName);
  }

  Future<ExchangeRateResponse> getExchangeRate() {
    return _nbrbApi.exchangeRateRequest();
  }

  Future<EtherchainResponse> getStat() {
    return _etherchainApi.getStat();
  }
}