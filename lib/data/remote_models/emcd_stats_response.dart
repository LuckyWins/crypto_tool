import 'package:json_annotation/json_annotation.dart';

part 'emcd_stats_response.g.dart';

@JsonSerializable()
class EmcdStatsResponse {

  @JsonKey(name: 'code')
  final int code;

  @JsonKey(name: 'market_price_usd')
  final double marketPriceUsd;

  @JsonKey(name: 'market_price_usd_change_24h_percentage')
  final double changePercentage;

  @JsonKey(name: 'market_price_btc')
  final String marketPriceBtc;

  @JsonKey(name: 'coin')
  final String coin;

  EmcdStatsResponse({
    required this.code,
    required this.marketPriceUsd,
    required this.changePercentage,
    required this.marketPriceBtc,
    required this.coin
  });

  factory EmcdStatsResponse.fromJson(Map<String, dynamic> json) => _$EmcdStatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmcdStatsResponseToJson(this);

}