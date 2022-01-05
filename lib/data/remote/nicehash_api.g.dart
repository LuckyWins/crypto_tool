// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nicehash_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NicehashApi implements NicehashApi {
  _NicehashApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api2.nicehash.com/main/api/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NicehashGpuResponse> device(deviceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device': deviceId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NicehashGpuResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/public/profcalc/device',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NicehashGpuResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
