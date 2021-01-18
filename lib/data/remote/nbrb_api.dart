import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'nbrb_api.g.dart';

@RestApi(baseUrl: "https://www.nbrb.by/api/exrates/rates")
abstract class NbrbApi {
  factory NbrbApi(Dio dio, {String baseUrl}) = _NbrbApi;

  @GET("/usd?parammode=2")
  Future<ExchangeRateResponse> exchangeRateRequest();

}