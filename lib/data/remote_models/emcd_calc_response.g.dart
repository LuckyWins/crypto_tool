// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emcd_calc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmcdCaldResponse _$EmcdCaldResponseFromJson(Map<String, dynamic> json) {
  return EmcdCaldResponse(
    coins: json['coins'] == null
        ? null
        : EmcdCaldResponseCoins.fromJson(json['coins'] as Map<String, dynamic>),
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$EmcdCaldResponseToJson(EmcdCaldResponse instance) =>
    <String, dynamic>{
      'coins': instance.coins,
      'code': instance.code,
    };

EmcdCaldResponseCoins _$EmcdCaldResponseCoinsFromJson(
    Map<String, dynamic> json) {
  return EmcdCaldResponseCoins(
    btc: EmcdCaldResponseCoins._doubleFromString(json['btc'] as String),
    eth: EmcdCaldResponseCoins._doubleFromString(json['eth'] as String),
  );
}

Map<String, dynamic> _$EmcdCaldResponseCoinsToJson(
        EmcdCaldResponseCoins instance) =>
    <String, dynamic>{
      'btc': instance.btc,
      'eth': instance.eth,
    };
