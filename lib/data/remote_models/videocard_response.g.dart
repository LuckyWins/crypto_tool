// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videocard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCardResponse _$VideoCardResponseFromJson(Map<String, dynamic> json) =>
    VideoCardResponse(
      products: (json['products'] as List<dynamic>)
          .map((e) => OnlinerVideocard.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      page:
          VideoCardResponsePage.fromJson(json['page'] as Map<String, dynamic>),
      totalUngrouped: json['total_ungrouped'] as int,
    );

Map<String, dynamic> _$VideoCardResponseToJson(VideoCardResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'page': instance.page,
      'total_ungrouped': instance.totalUngrouped,
    };

OnlinerVideocard _$OnlinerVideocardFromJson(Map<String, dynamic> json) =>
    OnlinerVideocard(
      name: json['name'] as String,
      microDescription: json['micro_description'] as String,
      prices: OnlinerVideocardPrices.fromJson(
          json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnlinerVideocardToJson(OnlinerVideocard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'micro_description': instance.microDescription,
      'prices': instance.prices,
    };

OnlinerVideocardPrices _$OnlinerVideocardPricesFromJson(
        Map<String, dynamic> json) =>
    OnlinerVideocardPrices(
      priceMin: OnlinerVideocardPrice.fromJson(
          json['price_min'] as Map<String, dynamic>),
      priceMax: OnlinerVideocardPrice.fromJson(
          json['price_max'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String?,
    );

Map<String, dynamic> _$OnlinerVideocardPricesToJson(
        OnlinerVideocardPrices instance) =>
    <String, dynamic>{
      'price_min': instance.priceMin,
      'price_max': instance.priceMax,
      'html_url': instance.htmlUrl,
    };

OnlinerVideocardPrice _$OnlinerVideocardPriceFromJson(
        Map<String, dynamic> json) =>
    OnlinerVideocardPrice(
      amount: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$OnlinerVideocardPriceToJson(
        OnlinerVideocardPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };

VideoCardResponsePage _$VideoCardResponsePageFromJson(
        Map<String, dynamic> json) =>
    VideoCardResponsePage(
      limit: json['limit'] as int,
      items: json['items'] as int,
      current: json['current'] as int,
      last: json['last'] as int,
    );

Map<String, dynamic> _$VideoCardResponsePageToJson(
        VideoCardResponsePage instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'items': instance.items,
      'current': instance.current,
      'last': instance.last,
    };
