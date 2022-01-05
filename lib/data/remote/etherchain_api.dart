import 'package:cryptotool/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'etherchain_api.g.dart';

@RestApi(baseUrl: 'https://etherchain.org/api')
abstract class EtherchainApi {
  factory EtherchainApi(Dio dio, {String baseUrl}) = _EtherchainApi;

  @GET('/basic_stats')
  Future<EtherchainResponse> getStat();

}