import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'alfabank_api.g.dart';

@RestApi(baseUrl: 'https://developerhub.alfabank.by:8273/partner/1.0.1')
abstract class AlfaBankApi {
  factory AlfaBankApi(Dio dio, {String baseUrl}) = _AlfaBankApi;

  @GET('/public/rates')
  Future<AlfabankRateResponse> getRates();

}