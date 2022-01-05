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
    final valueAsMap = json.decode(str) as Map<String, dynamic>;
    return Map<String, double>.from(
      valueAsMap.map<String, dynamic>((key, dynamic value) {
        var val = 0.0;
        if (value == null) {
          // val = 0;
        } else if (value is int) {
          val = value.toDouble();
        } else if (value is double) {
          val = value;
        } else if (value is String) {
          val = double.tryParse(value) ?? 0;
        }
        return MapEntry<String, double>(key, val);
      })
    );
  }

  NicehashGpuResponse({
    required this.id,
    required this.name,
    required this.power,
    required this.speeds
  });

  factory NicehashGpuResponse.fromJson(Map<String, dynamic> json) => _$NicehashGpuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NicehashGpuResponseToJson(this);

}