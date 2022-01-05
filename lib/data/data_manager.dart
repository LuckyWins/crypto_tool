import 'package:dio/dio.dart';

import 'data.dart';

class DataManager {
  final OnlinerApi _onlinerApi;
  final NbrbApi _nbrbApi;
  final AlfaBankApi _alfaBankApi;
  final EtherchainApi _etherchainApi;
  final NicehashApi _nicehashApi;
  final EmcdApi _emcdApi;
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

  Future<VideoCardResponse> getVideocard({
    required String gpuName,
    required bool lhr
  }) => _onlinerApi.videocardRequest(
    gpuName: gpuName,
    lhr: lhr ? 1 : 0
  );

  Future<ExchangeRateResponse> getExchangeRateNbrb() => _nbrbApi.exchangeRateRequest();

  Future<AlfabankRateResponse> getExchangeRateAlfabank() => _alfaBankApi.getRates();

  Future<EtherchainResponse> getStat() => _etherchainApi.getStat();

  Future<NicehashGpuResponse> getGpuInfo(String deviceId) => _nicehashApi.device(deviceId);

  Future<EmcdCaldResponse> getEmcdCalc() async => _emcdApi.getCalc();

  Future<EmcdStatsResponse> getEmcdStats() async => _emcdApi.getStats();
}