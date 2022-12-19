class UserSeatReservationInfoDto {
  final int seatNumber;
  final String seatState;
  final int startTime;
  final int timeInUse;
  final String fixedTermTicket;
  final String partTimeTicket;
  final int remainingTime;

  UserSeatReservationInfoDto({
    required this.seatNumber, required this.seatState, required this.startTime,
    required this.timeInUse , required this.fixedTermTicket, required this.partTimeTicket,
    required this.remainingTime});

  factory UserSeatReservationInfoDto.fromJson(Map<String, dynamic> json) {
    return UserSeatReservationInfoDto(
      seatNumber: json['seatNumber'] ?? 0,
      seatState: json['seatState'] ?? '',
      startTime: json['startTime'] ?? 0,
      timeInUse: json['timeInUse'] ?? 0,
      fixedTermTicket: json['fixedTermTicket'] ?? '',
      partTimeTicket: json['partTimeTicket'] ?? '',
      remainingTime: json['remainingTime'] ?? 0,
    );
  }
 // Map<int, String> toJson() => { seatNumber : seatState };
}