enum SortOptions {
  // от дешевой к дорогой
  cardPriceAsc,
  // от дорогой к дешевой
  cardPriceDesc,
  // от быстроокупаемой к плохоокупаемой
  paybackDesc,
  // от плохоокупаемой к быстроокупаемой
  paybackAsc,
  // от большого дохода в день к маленькому
  dailyUsdDesc,
  // от маленького дохода в день к большому
  dailyUsdAsc,
  // от наименьшей к наибльшей разнице в цене рынка/реальной
  priceRiseAsc,
  // по умолчанию,
  none
}

extension SortExtersion on SortOptions {

  static const Map<SortOptions, String> mapNamesForFilter = {
    SortOptions.cardPriceAsc: 'Дешевые',
    SortOptions.cardPriceDesc: 'Дорогие',
    SortOptions.paybackDesc: 'Быстроокупаемые',
    // SortOptions.paybackAsc: "Плохоокупаемые",
    SortOptions.dailyUsdDesc: 'Доходные',
    // SortOptions.dailyUsdAsc: "Менее прибыльные",
    SortOptions.priceRiseAsc: 'Рыночная цена/текущая цена',
  };

  static const Map<SortOptions, String> mapNames = {
    SortOptions.cardPriceAsc: 'Сначала дешевые',
    SortOptions.cardPriceDesc: 'Сначала дорогие',
    SortOptions.paybackDesc: 'Сначала быстроокупаемые',
    // SortOptions.paybackAsc: "Сначала плохоокупаемые",
    SortOptions.dailyUsdDesc: 'Сначала самые доходные',
    // SortOptions.dailyUsdAsc: "Сначала менее прибыльные",
    SortOptions.priceRiseAsc: 'Рыночная цена/текущая цена',
    SortOptions.none: 'По умолчанию'
  };

  String get name => mapNames[this] ?? 'Неизвестно';
}