// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nbrb_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NbrbApi implements NbrbApi {
  _NbrbApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.nbrb.by/api/exrates/rates';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ExchangeRateResponse> exchangeRateRequest() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExchangeRateResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/usd?parammode=2',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExchangeRateResponse.fromJson(_result.data!);
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
