import 'package:json_annotation/json_annotation.dart';

part 'videocard_response.g.dart';

@JsonSerializable()
class VideoCardResponse {

  @JsonKey(name: 'products')
  final List<OnlinerVideocard> products;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'page')
  final VideoCardResponsePage page;

  @JsonKey(name: 'total_ungrouped')
  final int totalUngrouped;

  VideoCardResponse({
    this.products,
    this.total,
    this.page,
    this.totalUngrouped
  });

  factory VideoCardResponse.fromJson(Map<String, dynamic> json) => _$VideoCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCardResponseToJson(this);
}

@JsonSerializable()
class OnlinerVideocard {

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'micro_description')
  final String microDescription;

  @JsonKey(name: 'prices')
  final OnlinerVideocardPrices prices;

  OnlinerVideocard({
    this.name,
    this.microDescription,
    this.prices
  });

  factory OnlinerVideocard.fromJson(Map<String, dynamic> json) => _$OnlinerVideocardFromJson(json);

  Map<String, dynamic> toJson() => _$OnlinerVideocardToJson(this);

}

@JsonSerializable()
class OnlinerVideocardPrices {

  @JsonKey(name: 'price_min')
  final OnlinerVideocardPrice priceMin;

  @JsonKey(name: 'price_max')
  final OnlinerVideocardPrice priceMax;

  @JsonKey(name: 'html_url')
  final String htmlUrl;

  OnlinerVideocardPrices({
    this.priceMin,
    this.priceMax,
    this.htmlUrl
  });

  factory OnlinerVideocardPrices.fromJson(Map<String, dynamic> json) => _$OnlinerVideocardPricesFromJson(json);

  Map<String, dynamic> toJson() => _$OnlinerVideocardPricesToJson(this);

}

@JsonSerializable()
class OnlinerVideocardPrice {

  @JsonKey(name: 'amount')
  final String amount;

  @JsonKey(name: 'currency')
  final String currency;

  OnlinerVideocardPrice({
    this.amount,
    this.currency
  });

  factory OnlinerVideocardPrice.fromJson(Map<String, dynamic> json) => _$OnlinerVideocardPriceFromJson(json);

  Map<String, dynamic> toJson() => _$OnlinerVideocardPriceToJson(this);

}

@JsonSerializable()
class VideoCardResponsePage {

  @JsonKey(name: 'limit')
  final int limit;

  @JsonKey(name: 'items')
  final int items;

  @JsonKey(name: 'current')
  final int current;

  @JsonKey(name: 'last')
  final int last;

  VideoCardResponsePage({
    this.limit,
    this.items,
    this.current,
    this.last
  });

  factory VideoCardResponsePage.fromJson(Map<String, dynamic> json) => _$VideoCardResponsePageFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCardResponsePageToJson(this);

}