import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'nicehash_api.g.dart';

@RestApi(baseUrl: "https://api2.nicehash.com/main/api/v2")
abstract class NicehashApi {
  factory NicehashApi(Dio dio, {String baseUrl}) = _NicehashApi;

  @GET("/public/profcalc/device")
  Future<NicehashGpuResponse> device(@Query("device") String deviceId);

}