// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfabank_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AlfaBankApi implements AlfaBankApi {
  _AlfaBankApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://developerhub.alfabank.by:8273/partner/1.0.1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AlfabankRateResponse> getRates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AlfabankRateResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/public/rates',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AlfabankRateResponse.fromJson(_result.data!);
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
