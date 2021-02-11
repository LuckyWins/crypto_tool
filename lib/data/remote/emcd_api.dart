import 'dart:convert';

import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// part 'emcd_api.g.dart';

// @RestApi(baseUrl: "https://common.emcd.io")
abstract class EmcdApi {
  factory EmcdApi(Dio dio, {String baseUrl}) = _EmcdApi;

  // @GET("/get_calc?emcd=1")
  Future<EmcdCaldResponse> getCalc();

  // @GET("/eth/stats?emcd=1")
  Future<EmcdStatsResponse> getStats();

}

// **************************************************************************
// RetrofitGenerator WITH FIX (String on input)
// **************************************************************************

class _EmcdApi implements EmcdApi {
  _EmcdApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://common.emcd.io';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<EmcdCaldResponse> getCalc() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>('/get_calc?emcd=1',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EmcdCaldResponse.fromJson(json.decode(_result.data));
    return value;
  }

  @override
  Future<EmcdStatsResponse> getStats() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>('/eth/stats?emcd=1',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EmcdStatsResponse.fromJson(json.decode(_result.data));
    return value;
  }
}
