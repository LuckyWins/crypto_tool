enum CalculateTime {
  hour, day, week, month
}

extension CalculateTimeExtension on CalculateTime {
  static Map<CalculateTime, double> _calculationTactics = {
    CalculateTime.hour: 1/24,
    CalculateTime.day: 1,
    CalculateTime.week: 7,
    CalculateTime.month: 30
  };

  double get calculationTactic => _calculationTactics[this]!;

  static Map<CalculateTime, String> _names = {
    CalculateTime.hour: 'Час',
    CalculateTime.day: 'День',
    CalculateTime.week: 'Неделя',
    CalculateTime.month: 'Месяц'
  };

  String get name => _names[this]!;

  static Map<CalculateTime, String> _calculationNames = {
    CalculateTime.hour: 'час',
    CalculateTime.day: 'день',
    CalculateTime.week: 'неделю',
    CalculateTime.month: 'месяц'
  };

  String get calculationName => _calculationNames[this]!;
}