// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfabank_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AlfaBankApi implements AlfaBankApi {
  _AlfaBankApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://developerhub.alfabank.by:8273/partner/1.0.1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AlfabankRateResponse> getRates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/public/rates',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AlfabankRateResponse.fromJson(_result.data);
    return value;
  }
}
