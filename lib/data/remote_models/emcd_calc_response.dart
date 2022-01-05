import 'package:json_annotation/json_annotation.dart';

part 'emcd_calc_response.g.dart';

@JsonSerializable()
class EmcdCaldResponse {

  @JsonKey(name: 'coins')
  final EmcdCaldResponseCoins coins;

  @JsonKey(name: 'code')
  final int code;

  EmcdCaldResponse({
    required this.coins,
    required this.code
  });

  factory EmcdCaldResponse.fromJson(Map<String, dynamic> json) => _$EmcdCaldResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmcdCaldResponseToJson(this);

}

@JsonSerializable()
class EmcdCaldResponseCoins {

  @JsonKey(name: 'btc', fromJson: _doubleFromString)
  final double btc;

  @JsonKey(name: 'eth', fromJson: _doubleFromString)
  final double eth;

  static double _doubleFromString(String value) {
    return double.tryParse(value) ?? 1;
  }

  EmcdCaldResponseCoins({
    required this.btc,
    required this.eth
  });

  factory EmcdCaldResponseCoins.fromJson(Map<String, dynamic> json) => _$EmcdCaldResponseCoinsFromJson(json);

  Map<String, dynamic> toJson() => _$EmcdCaldResponseCoinsToJson(this);

}