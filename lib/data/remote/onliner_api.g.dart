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
  Future<VideoCardResponse> videocardRequest(gpuName) async {
    ArgumentError.checkNotNull(gpuName, 'gpuName');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'desktop_gpu[0]': gpuName};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/videocard?desktop_gpu[operation]=union&videoram_videoc[from]=6gb&order=price:asc',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VideoCardResponse.fromJson(_result.data);
    return value;
  }
}
