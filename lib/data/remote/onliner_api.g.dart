// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onliner_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OnlinerApi implements OnlinerApi {
  _OnlinerApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://catalog.onliner.by/sdapi/catalog.api/search';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<VideoCardResponse> videocardRequest(gpuName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'desktop_gpu[0]': gpuName};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        VideoCardResponse>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/videocard?desktop_gpu[operation]=union&videoram_videoc[from]=6gb&order=price:asc',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoCardResponse.fromJson(_result.data!);
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
