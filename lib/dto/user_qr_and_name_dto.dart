class UserQrAndNameDto {

  final String userName;
  final String qrCode;

  UserQrAndNameDto({required this.userName, required this.qrCode});

  factory UserQrAndNameDto.fromJson(Map<String, dynamic> json) {
    return UserQrAndNameDto(
        userName: json['name'],
        qrCode: json['qrCode'],
    );
  }

  String getUserName() => userName;

  Map<String, String> toJson() => { userName : qrCode };

}