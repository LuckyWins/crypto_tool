import 'package:json_annotation/json_annotation.dart';

part 'etherchain_response.g.dart';

@JsonSerializable()
class EtherchainResponse {

  @JsonKey(name: 'currentStats')
  final EtherchainResponseStat currentStats;

  EtherchainResponse({
    required this.currentStats
  });

  factory EtherchainResponse.fromJson(Map<String, dynamic> json) => _$EtherchainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EtherchainResponseToJson(this);

}

@JsonSerializable()
class EtherchainResponseStat {

  @JsonKey(name: 'price_usd')
  final double priceUsd;

  @JsonKey(name: 'price_btc')
  final double priceBtc;

  @JsonKey(name: 'difficulty')
  final double difficulty;

  @JsonKey(name: 'block_reward')
  final double blockReward;

  EtherchainResponseStat({
    required this.priceUsd,
    required this.priceBtc,
    required this.difficulty,
    required this.blockReward
  });

  factory EtherchainResponseStat.fromJson(Map<String, dynamic> json) => _$EtherchainResponseStatFromJson(json);

  Map<String, dynamic> toJson() => _$EtherchainResponseStatToJson(this);

}