import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Videocard extends Equatable {
  final String name;
  final String descriprtion;
  final double minPrice;
  final double maxPrice;

  const Videocard({
    @required this.name,
    @required this.descriprtion,
    @required this.minPrice,
    @required this.maxPrice
  });

  @override
  List<Object> get props => [name, minPrice, maxPrice];

  @override
  String toString() => "Videocard( name = $name, minPrice = $minPrice, maxPrice = $maxPrice )";
}