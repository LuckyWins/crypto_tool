import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate_response.g.dart';

@JsonSerializable()
class ExchangeRateResponse {

  @JsonKey(name: 'Cur_ID')
  final int id;

  @JsonKey(name: 'Date')
  final String date;

  @JsonKey(name: 'Cur_Abbreviation')
  final String abbreviation;

  @JsonKey(name: 'Cur_Scale')
  final int scale;

  @JsonKey(name: 'Cur_Name')
  final String name;

  @JsonKey(name: 'Cur_OfficialRate')
  final double officialRate;

  ExchangeRateResponse({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.officialRate
  });

  factory ExchangeRateResponse.fromJson(Map<String, dynamic> json) => _$ExchangeRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateResponseToJson(this);

}