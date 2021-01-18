// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateResponse _$ExchangeRateResponseFromJson(Map<String, dynamic> json) {
  return ExchangeRateResponse(
    id: json['Cur_ID'] as int,
    date: json['Date'] as String,
    abbreviation: json['Cur_Abbreviation'] as String,
    scale: json['Cur_Scale'] as int,
    name: json['Cur_Name'] as String,
    officialRate: (json['Cur_OfficialRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ExchangeRateResponseToJson(
        ExchangeRateResponse instance) =>
    <String, dynamic>{
      'Cur_ID': instance.id,
      'Date': instance.date,
      'Cur_Abbreviation': instance.abbreviation,
      'Cur_Scale': instance.scale,
      'Cur_Name': instance.name,
      'Cur_OfficialRate': instance.officialRate,
    };
