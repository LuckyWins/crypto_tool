// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nicehash_gpu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NicehashGpuResponse _$NicehashGpuResponseFromJson(Map<String, dynamic> json) =>
    NicehashGpuResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      power: (json['power'] as num).toDouble(),
      speeds: NicehashGpuResponse._speedsFromString(json['speeds'] as String),
    );

Map<String, dynamic> _$NicehashGpuResponseToJson(
        NicehashGpuResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'power': instance.power,
      'speeds': instance.speeds,
    };
