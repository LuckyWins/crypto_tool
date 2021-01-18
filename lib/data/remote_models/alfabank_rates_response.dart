import 'package:json_annotation/json_annotation.dart';

part 'alfabank_rates_response.g.dart';

@JsonSerializable()
class AlfabankRateResponse {

  @JsonKey(name: 'rates')
  final List<AlfabankRateItem> rates;

  AlfabankRateResponse({
    this.rates
  });

  factory AlfabankRateResponse.fromJson(Map<String, dynamic> json) => _$AlfabankRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlfabankRateResponseToJson(this);

}

@JsonSerializable()
class AlfabankRateItem {

  @JsonKey(name: 'sellRate')
  final double sellRate;

  @JsonKey(name: 'sellCode')
  final int sellCode;

  @JsonKey(name: 'buyCode')
  final int buyCode;

  @JsonKey(name: 'buyRate')
  final double buyRate;

  AlfabankRateItem({
    this.sellRate,
    this.sellCode,
    this.buyCode,
    this.buyRate
  });

  factory AlfabankRateItem.fromJson(Map<String, dynamic> json) => _$AlfabankRateItemFromJson(json);

  Map<String, dynamic> toJson() => _$AlfabankRateItemToJson(this);

}