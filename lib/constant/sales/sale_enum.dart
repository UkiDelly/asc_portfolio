enum SalesRange {
  oneDay(1),
  oneWeek(7),
  oneMonth(30);

  const SalesRange(this.range);
  final int range;

  // convert enum to int
  int get enumToInt => range;
}
