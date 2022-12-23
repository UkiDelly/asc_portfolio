import '../../../model/user_ticket_model.dart';

enum Product {
  todayFixedTermTicket('당일권', 10000, Term.fixedTerm),
  weekFixedTermTicket('7일권', 15000, Term.fixedTerm),
  twoWeekFixedTermTicket('14일권', 30000, Term.fixedTerm),
  threeWeekFixedTermTicket('21일권', 40000, Term.fixedTerm),
  fourWeekedFixedTermTicket('28일권', 50000, Term.fixedTerm),
  oneHourPartTimeTicket('1시간권', 1000, Term.partTime),
  fourHourPartTimeTicket('4시간권', 7000, Term.partTime),
  tenHourPartTimeTicket('10시간권', 10000, Term.partTime),
  fiftyHourPartTimeTicket('50시간권', 100, Term.partTime),
  hundredHourPartTimeTicket('100시간권', 50000, Term.partTime),
  undefined('undefined', 0, Term.none);

  const Product(this.name, this.price, this.label);
  final String name;
  final double price;
  final Term label;

  factory Product.getByCode(String term) {
    return Product.values.firstWhere(
      (value) => value.label.toString() == term,
      orElse: () => Product.undefined,
    );
  }
}
