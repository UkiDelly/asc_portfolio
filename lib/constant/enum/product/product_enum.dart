enum Product {
  TODAY_FIXED_TERM_TICKET('당일권', 10000, 'FIXED-TERM'),
  WEEK_FIXED_TERM_TICKET('7일권', 15000, 'FIXED-TERM'),
  TWO_WEEK_FIXED_TERM_TICKET('14일권', 30000, 'FIXED-TERM'),
  THREE_WEEK_FIXED_TERM_TICKET('21일권', 40000, 'FIXED-TERM'),
  FOUR_WEEK_FIXED_TERM_TICKET('28일권', 50000, 'FIXED-TERM'),
  ONE_HOUR_PART_TIME_TICKET('1시간권', 1000, 'PART-TIME'),
  FOUR_HOUR_PART_TIME_TICKET('4시간권', 7000, 'PART-TIME'),
  TEN_HOUR_PART_TIME_TICKET('10시간권', 10000, 'PART-TIME'),
  FIFTY_HOUR_PART_TIME_TICKET('50시간권', 100, 'PART-TIME'),
  HUNDRED_HOUR_PART_TIME_TICKET('100시간권', 50000, 'PART-TIME'),
  UNDEFINED('undefined', 0, '');

  const Product(this.name, this.price, this.label);
  final String name;
  final double price;
  final String label;

  factory Product.getByCode(String term) {
    return Product.values.firstWhere(
      (value) => value.label == term,
      orElse: () => Product.UNDEFINED,
    );
  }
}
