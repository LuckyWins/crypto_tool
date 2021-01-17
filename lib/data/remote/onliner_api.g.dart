// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onliner_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OnlinerApi implements OnlinerApi {
  _OnlinerApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://catalog.onliner.by/sdapi/catalog.api/search';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<String> testRequest() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        '/videocard?desktop_gpu[0]=gtx1660super&desktop_gpu[operation]=union&videoram_videoc[from]=6gb&order=price:asc',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
