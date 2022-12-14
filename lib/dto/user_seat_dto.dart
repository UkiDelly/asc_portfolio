class UserSeatDto {
  final int seatNumber;
  final String seatState;

  UserSeatDto({required this.seatNumber, required this.seatState});

  factory UserSeatDto.fromJson(Map<String, dynamic> json) {
    return UserSeatDto(
        seatNumber: json['seatNumber'],
        seatState: json['seatState'],
    );
  }

  Map<int, String> toJson() => { seatNumber : seatState };

}