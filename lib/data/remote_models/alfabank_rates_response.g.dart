// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfabank_rates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfabankRateResponse _$AlfabankRateResponseFromJson(Map<String, dynamic> json) {
  return AlfabankRateResponse(
    rates: (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : AlfabankRateItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AlfabankRateResponseToJson(
        AlfabankRateResponse instance) =>
    <String, dynamic>{
      'rates': instance.rates,
    };

AlfabankRateItem _$AlfabankRateItemFromJson(Map<String, dynamic> json) {
  return AlfabankRateItem(
    sellRate: (json['sellRate'] as num)?.toDouble(),
    sellCode: json['sellCode'] as int,
    buyCode: json['buyCode'] as int,
    buyRate: (json['buyRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AlfabankRateItemToJson(AlfabankRateItem instance) =>
    <String, dynamic>{
      'sellRate': instance.sellRate,
      'sellCode': instance.sellCode,
      'buyCode': instance.buyCode,
      'buyRate': instance.buyRate,
    };
