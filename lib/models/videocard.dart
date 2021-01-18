import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class Videocard extends Equatable {
  final String gpuName;
  final String onlinerGpuName;
  final String name;
  final String descriprtion;
  final double minPrice;
  final double maxPrice;
  final double hashRate;
  final double reward;
  final double dailyInBtc;
  final double dailyInUsd;

  const Videocard({
    this.gpuName,
    this.onlinerGpuName,
    this.name,
    this.descriprtion,
    this.minPrice,
    this.maxPrice,
    this.hashRate,
    this.reward,
    this.dailyInBtc,
    this.dailyInUsd
  });

  Videocard copy({
    String gpuName,
    String onlinerGpuName,
    String name,
    String descriprtion,
    double minPrice,
    double maxPrice,
    double hashRate,
    double reward,
    double dailyInBtc,
    double dailyInUsd
  }) => Videocard(
    gpuName: gpuName ?? this.gpuName,
    onlinerGpuName: onlinerGpuName ?? this.onlinerGpuName,
    name: name ?? this.name,
    descriprtion: descriprtion ?? this.descriprtion,
    minPrice: minPrice ?? this.minPrice,
    maxPrice: maxPrice ?? this.maxPrice,
    hashRate: hashRate ?? this.hashRate,
    reward: reward ?? this.reward,
    dailyInBtc: dailyInBtc ?? this.dailyInBtc,
    dailyInUsd: dailyInUsd ?? this.dailyInUsd
  );

  double get rewardPerDay => reward * 24;

  int get paybackDays => (minPrice / dailyInUsd).round();

  Color get paybackRateColor {
    if (paybackDays > 300) {
      return Color(0xffe49a9a);
    } else if (paybackDays > 200) {
      return Color(0xffe4cd9a);
    } if (paybackDays > 100) {
      return Color(0xffdbe49a);
    } else {
      return Color(0xff9de49a);
    }
  }

  @override
  List<Object> get props => [gpuName, minPrice, maxPrice, hashRate];

  @override
  String toString() => "Videocard( gpuName = $gpuName, minPrice = $minPrice, maxPrice = $maxPrice, hashRate = $hashRate)";
}