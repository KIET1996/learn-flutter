const String tableElectric = 'electric';

class ElectricFields {
  static final List<String> values = [
    /// Add all fields
    id, monthYear, indicator, quantity, price, time
  ];

  static final String id = '_id';
  static final String monthYear = 'monthYear';
  static final String indicator = 'indicator';
  static final String quantity = 'quantity';
  static final String price = 'price';
  static final String time = 'time';
}

class Electric {
  final int? id;
  final String monthYear;
  final double indicator;
  final double quantity;
  final double price;
  final DateTime createdTime;

  const Electric({
    this.id,
    required this.monthYear,
    required this.indicator,
    required this.quantity,
    required this.price,
    required this.createdTime,
  });

  Electric copy({
    int? id,
    String? monthYear,
    double? indicator,
    double? quantity,
    double? price,
    DateTime? createdTime,
  }) =>
      Electric(
        id: id ?? this.id,
        monthYear: monthYear ?? this.monthYear,
        indicator: indicator ?? this.indicator,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        createdTime: createdTime ?? this.createdTime,
      );

  static Electric fromJson(Map<String, Object?> json) => Electric(
    id: json[ElectricFields.id] as int?,
    monthYear: json[ElectricFields.monthYear] as String,
    indicator: json[ElectricFields.indicator] as double,
    quantity: json[ElectricFields.quantity] as double,
    price: json[ElectricFields.price] as double,
    createdTime: DateTime.parse(json[ElectricFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    ElectricFields.id: id,
    ElectricFields.monthYear: monthYear,
    ElectricFields.indicator: indicator,
    ElectricFields.quantity: quantity,
    ElectricFields.price: price,
    ElectricFields.time: createdTime.toIso8601String(),
  };
}