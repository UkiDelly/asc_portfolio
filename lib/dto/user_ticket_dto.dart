class UserTicketDto {
  final String isValidTicket;
  final String? fixedTermTicket;
  final String productLabel;
  final int? partTimeTicket;
  final int? remainingTime;
  final int? period;

  UserTicketDto({required this.isValidTicket, required this.fixedTermTicket, required this.productLabel, required this.partTimeTicket,
  required this.remainingTime, required this.period});

  factory UserTicketDto.fromJson(Map<dynamic, dynamic> json) {
    return UserTicketDto(
      isValidTicket: json['isValidTicket'],
      fixedTermTicket: json['fixedTermTicket'],
      productLabel: json['productLabel'],
      partTimeTicket: json['partTimeTicket'],
      remainingTime: json['remainingTime'],
      period: json['period'],
    );
  }

  Map<String, dynamic> toJson() => {
    'isValidTicket' : isValidTicket,
    'fixedTermTicket' : fixedTermTicket ?? '',
    'productLabel' : productLabel ?? '',
    'period' : period ?? 0,
    'partTimeTicket' : partTimeTicket ?? 0,
    'remainingTime' : remainingTime ?? 0
  };
}