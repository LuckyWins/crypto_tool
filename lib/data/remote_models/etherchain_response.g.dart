// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etherchain_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtherchainResponse _$EtherchainResponseFromJson(Map<String, dynamic> json) {
  return EtherchainResponse(
    currentStats: json['currentStats'] == null
        ? null
        : EtherchainResponseStat.fromJson(
            json['currentStats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EtherchainResponseToJson(EtherchainResponse instance) =>
    <String, dynamic>{
      'currentStats': instance.currentStats,
    };

EtherchainResponseStat _$EtherchainResponseStatFromJson(
    Map<String, dynamic> json) {
  return EtherchainResponseStat(
    priceUsd: (json['price_usd'] as num)?.toDouble(),
    priceBtc: (json['price_btc'] as num)?.toDouble(),
    difficulty: (json['difficulty'] as num)?.toDouble(),
    blockReward: (json['block_reward'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EtherchainResponseStatToJson(
        EtherchainResponseStat instance) =>
    <String, dynamic>{
      'price_usd': instance.priceUsd,
      'price_btc': instance.priceBtc,
      'difficulty': instance.difficulty,
      'block_reward': instance.blockReward,
    };
