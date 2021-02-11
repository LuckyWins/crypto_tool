// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emcd_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmcdStatsResponse _$EmcdStatsResponseFromJson(Map<String, dynamic> json) {
  return EmcdStatsResponse(
    code: json['code'] as int,
    marketPriceUsd: (json['market_price_usd'] as num)?.toDouble(),
    changePercentage:
        (json['market_price_usd_change_24h_percentage'] as num)?.toDouble(),
    marketPriceBtc: json['market_price_btc'] as String,
    coin: json['coin'] as String,
  );
}

Map<String, dynamic> _$EmcdStatsResponseToJson(EmcdStatsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'market_price_usd': instance.marketPriceUsd,
      'market_price_usd_change_24h_percentage': instance.changePercentage,
      'market_price_btc': instance.marketPriceBtc,
      'coin': instance.coin,
    };
