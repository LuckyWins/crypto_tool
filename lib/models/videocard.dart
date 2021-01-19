import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Videocard extends Equatable {
  final String gpuName;
  final String gpuDescription;
  final String onlinerGpuName;
  final String name;
  final String descriprtion;
  final double minPrice;
  final double maxPrice;
  final double hashRate;
  final double reward;
  final double dailyInBtc;
  final double dailyInUsd;
  final String pricesUrl;
  final double expectedPrice;
  final double powerUsage;

  const Videocard({
    @required this.gpuName,
    this.gpuDescription = "",
    @required this.onlinerGpuName,
    this.name,
    this.descriprtion,
    this.minPrice,
    this.maxPrice,
    @required this.hashRate,
    this.reward,
    this.dailyInBtc,
    this.dailyInUsd,
    this.pricesUrl,
    this.expectedPrice = 0.0,
    this.powerUsage = 0.0
  });

  Videocard copy({
    String gpuName,
    String gpuDescription,
    String onlinerGpuName,
    String name,
    String descriprtion,
    double minPrice,
    double maxPrice,
    double hashRate,
    double reward,
    double dailyInBtc,
    double dailyInUsd,
    String pricesUrl,
    double expectedPrice,
    double powerUsage
  }) => Videocard(
    gpuName: gpuName ?? this.gpuName,
    gpuDescription: gpuDescription ?? this.gpuDescription,
    onlinerGpuName: onlinerGpuName ?? this.onlinerGpuName,
    name: name ?? this.name,
    descriprtion: descriprtion ?? this.descriprtion,
    minPrice: minPrice ?? this.minPrice,
    maxPrice: maxPrice ?? this.maxPrice,
    hashRate: hashRate ?? this.hashRate,
    reward: reward ?? this.reward,
    dailyInBtc: dailyInBtc ?? this.dailyInBtc,
    dailyInUsd: dailyInUsd ?? this.dailyInUsd,
    pricesUrl: pricesUrl ?? this.pricesUrl,
    expectedPrice: expectedPrice ?? this.expectedPrice,
    powerUsage: powerUsage ?? this.powerUsage
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
      if (paybackDays == 0) {
        return Colors.black.withOpacity(0.3);
      } else {
        return Color(0xff9de49a);
      }
    } 
  }

  @override
  List<Object> get props => [gpuName, minPrice, maxPrice, hashRate];

  @override
  String toString() => "Videocard( gpuName = $gpuName, minPrice = $minPrice, maxPrice = $maxPrice, hashRate = $hashRate)";
}