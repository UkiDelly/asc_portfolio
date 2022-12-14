class TokenDto {
  final String roleType;
  final String accessToken;

  TokenDto({required this.roleType, required this.accessToken});

  factory TokenDto.fromJson(Map<dynamic, dynamic> json) {
    return TokenDto(
      roleType: json['roleType'],
      accessToken: json['accessToken']
    );
  }

  Map<String, dynamic> toJson() => {
    'roleType' : roleType,
    'accessToken' : accessToken ?? '',
  };
}