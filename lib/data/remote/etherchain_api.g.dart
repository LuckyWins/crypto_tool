// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etherchain_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EtherchainApi implements EtherchainApi {
  _EtherchainApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://etherchain.org/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EtherchainResponse> getStat() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EtherchainResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/basic_stats',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EtherchainResponse.fromJson(_result.data!);
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
