// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nicehash_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NicehashApi implements NicehashApi {
  _NicehashApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api2.nicehash.com/main/api/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<NicehashGpuResponse> device(deviceId) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device': deviceId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/public/profcalc/device',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NicehashGpuResponse.fromJson(_result.data);
    return value;
  }
}
