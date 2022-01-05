import 'package:dio/dio.dart';

import 'data.dart';

class DataManager {
  OnlinerApi _onlinerApi;
  NbrbApi _nbrbApi;
  AlfaBankApi _alfaBankApi;
  EtherchainApi _etherchainApi;
  NicehashApi _nicehashApi;
  EmcdApi _emcdApi;
  final Dio dio;

  DataManager(this.dio) :
    _onlinerApi = OnlinerApi(dio),
    _nbrbApi = NbrbApi(dio),
    _alfaBankApi = AlfaBankApi(dio),
    _etherchainApi = EtherchainApi(dio),
    _nicehashApi = NicehashApi(dio),
    _emcdApi = EmcdApi(dio);

  bool gpuFirstLoaded = false;
  bool calculatorFirstLoaded = false;

  Future<VideoCardResponse> getVideocard(String gpuName) {
    return _onlinerApi.videocardRequest(gpuName);
  }

  Future<ExchangeRateResponse> getExchangeRateNbrb() {
    return _nbrbApi.exchangeRateRequest();
  }

  Future<AlfabankRateResponse> getExchangeRateAlfabank() {
    return _alfaBankApi.getRates();
  }

  Future<EtherchainResponse> getStat() {
    return _etherchainApi.getStat();
  }

  Future<NicehashGpuResponse> getGpuInfo(String deviceId) {
    return _nicehashApi.device(deviceId);
  }

  Future<EmcdCaldResponse> getEmcdCalc() async {
    return _emcdApi.getCalc();
  }

  Future<EmcdStatsResponse> getEmcdStats() async {
    return _emcdApi.getStats();
  }
}