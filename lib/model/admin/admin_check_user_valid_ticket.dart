class AdminCheckUserValidTicket {
  final String isValidTicket;
  final String fixedTermTicket;
  final int partTimeTicket;
  final int remainingTime;
  final String productLabel;
  final int ticketPrice;
  final String createDate;
  final String modifiedDate;
  final String productNameType;
  final int period;

  AdminCheckUserValidTicket({
    required this.isValidTicket,
    required this.fixedTermTicket,
    required this.partTimeTicket,
    required this.remainingTime,
    required this.productLabel,
    required this.ticketPrice,
    required this.createDate,
    required this.modifiedDate,
    required this.productNameType,
    required this.period,
  });

  factory AdminCheckUserValidTicket.fromJson(Map<String, dynamic> json) {
    return AdminCheckUserValidTicket(
      isValidTicket: json['isValidTicket'] ?? '',
      fixedTermTicket: json['fixedTermTicket'] ?? '',
      partTimeTicket: json['partTimeTicket'] ?? 0,
      remainingTime: json['remainingTime'] ?? 0,
      productLabel: json['productLabel'] ?? '',
      ticketPrice: json['ticketPrice'] ?? 0,
      createDate: json['createDate'] ?? '',
      modifiedDate: json['modifiedDate'] ?? '',
      productNameType: json['productNameType'] ?? '',
      period: json['period'] ?? 0,
    );
  }
}
