import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'onliner_api.g.dart';

@RestApi(baseUrl: "https://catalog.onliner.by/sdapi/catalog.api/search")
abstract class OnlinerApi {
  factory OnlinerApi(Dio dio, {String baseUrl}) = _OnlinerApi;

  @GET("/videocard?desktop_gpu[operation]=union&videoram_videoc[from]=6gb&order=price:asc")
  Future<VideoCardResponse> videocardRequest(@Query("desktop_gpu[0]") String gpuName);

}