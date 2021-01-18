// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nbrb_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NbrbApi implements NbrbApi {
  _NbrbApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.nbrb.by/api/exrates/rates';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ExchangeRateResponse> exchangeRateRequest() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/usd?parammode=2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ExchangeRateResponse.fromJson(_result.data);
    return value;
  }
}
