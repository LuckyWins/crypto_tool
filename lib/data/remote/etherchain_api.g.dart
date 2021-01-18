// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etherchain_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EtherchainApi implements EtherchainApi {
  _EtherchainApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://etherchain.org/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<EtherchainResponse> getStat() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/basic_stats',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EtherchainResponse.fromJson(_result.data);
    return value;
  }
}
