import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'nicehash_gpu_response.g.dart';

@JsonSerializable()
class NicehashGpuResponse {

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'power')
  final double power;

  @JsonKey(name: 'speeds', fromJson: _speedsFromString)
  final Map<String, double> speeds;

  static Map<String, double> _speedsFromString(String str) {
    Map<String, dynamic> valueAsMap = json.decode(str);
    return Map<String, double>.from(
      valueAsMap.map((key, value) => MapEntry(key, value is int ? value.toDouble() : value is double ? value : double.tryParse(value)))
    );
  }

  NicehashGpuResponse({
    this.id,
    this.name,
    this.power,
    this.speeds
  });

  factory NicehashGpuResponse.fromJson(Map<String, dynamic> json) => _$NicehashGpuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NicehashGpuResponseToJson(this);

}