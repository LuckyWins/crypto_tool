import 'package:cryptotool/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Videocard extends Equatable {
  final String gpuName;
  final String gpuDescription;
  final String onlinerGpuName;
  final String? name;
  final String? descriprtion;
  final double minPrice;
  final double maxPrice;
  final double hashRate;
  /// reward in ETH for 1 hour
  final double reward;
  // доход сутки BTC
  final double revenueDailyInBtc;
  /// доход сутки USD
  final double revenueDailyInUsd;
  /// прибыль сутки USD
  final double profitDailyInUsd;
  final double electricityExpensesDaily;
  final String? pricesUrl;
  final double expectedPrice;
  final double powerUsage;
  /// nicehash device id for getting actual [powerUsage] & [hashRate]
  final String? nicehashId;
  /// is stat loaded from nicehash
  final bool isStatActual;
  // LHR?
  final bool lhr;

  const Videocard({
    required this.gpuName,
    this.gpuDescription = '',
    required this.onlinerGpuName,
    this.name,
    this.descriprtion,
    this.minPrice = 0,
    this.maxPrice = 0.0,
    required this.hashRate,
    this.reward = 0.0,
    this.revenueDailyInBtc = 0.0,
    this.revenueDailyInUsd = 0.0,
    this.profitDailyInUsd = 0.0,
    this.electricityExpensesDaily = 0.0,
    this.pricesUrl,
    this.expectedPrice = 0.0,
    this.powerUsage = 0.0,
    this.nicehashId,
    this.isStatActual = false,
    this.lhr = false
  });

  Videocard copy({
    String? gpuName,
    String? gpuDescription,
    String? onlinerGpuName,
    String? name,
    String? descriprtion,
    double? minPrice,
    double? maxPrice,
    double? hashRate,
    double? reward,
    double? revenueDailyInBtc,
    double? revenueDailyInUsd,
    double? profitDailyInBtc,
    double? profitDailyInUsd,
    double? electricityExpensesDaily,
    String? pricesUrl,
    double? expectedPrice,
    double? powerUsage,
    String? nicehashId,
    bool? isStatActual
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
    revenueDailyInBtc: revenueDailyInBtc ?? this.revenueDailyInBtc,
    revenueDailyInUsd: revenueDailyInUsd ?? this.revenueDailyInUsd,
    profitDailyInUsd: profitDailyInUsd ?? this.profitDailyInUsd,
    electricityExpensesDaily: electricityExpensesDaily ?? this.electricityExpensesDaily,
    pricesUrl: pricesUrl ?? this.pricesUrl,
    expectedPrice: expectedPrice ?? this.expectedPrice,
    powerUsage: powerUsage ?? this.powerUsage,
    nicehashId: nicehashId ?? this.nicehashId,
    isStatActual: isStatActual ?? this.isStatActual
  );

  double get rewardPerDay => reward * 24;

  // ignore: avoid_positional_boolean_parameters
  int paybackDays(bool includeElectricityCost) {
    final sum = includeElectricityCost ? profitDailyInUsd : revenueDailyInUsd;
    return (minPrice / sum).round();
  }

  // ignore: avoid_positional_boolean_parameters
  Color paybackRateColor(bool includeElectricityCost) {
    final value = paybackDays(includeElectricityCost);
    if (value > 300) {
      return const Color(0xffe49a9a);
    } else if (value > 200) {
      return const Color(0xffe4cd9a);
    } if (value > 100) {
      return const Color(0xffdbe49a);
    } else {
      if (value == 0) {
        return Colors.black.withOpacity(0.3);
      } else {
        return const Color(0xff9de49a);
      }
    } 
  }

  /// shows the difference between the [expectedPrice] and the [minPrice]
  double get priceRise {
    final finalPrice = minPrice == 0.0 ? expectedPrice : minPrice;
    return (((finalPrice - expectedPrice)/expectedPrice) * 100).roundFixed();
  }

  @override
  List<Object> get props => [gpuName, minPrice, maxPrice, hashRate];

  @override
  String toString() => 'Videocard( gpuName = $gpuName, minPrice = $minPrice, maxPrice = $maxPrice, hashRate = $hashRate)';
}