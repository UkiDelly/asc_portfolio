class UserSeatReservationInfoDto {
  final int seatNumber;
  final int startTime;
  final int timeInUse;
  final String createDate;
  final String period;

  UserSeatReservationInfoDto({required this.seatNumber, required this.startTime, required this.timeInUse, required this.createDate, required this.period});

  factory UserSeatReservationInfoDto.fromJson(Map<String, dynamic> json) {
    return UserSeatReservationInfoDto(
      seatNumber: json['seatNumber'],
      startTime: json['startTime'] ?? 0,
      timeInUse: json['timeInUse'] ?? 0,
      createDate: json['createDate'],
      period: json['period']
    );
  }
 // Map<int, String> toJson() => { seatNumber : seatState };
}