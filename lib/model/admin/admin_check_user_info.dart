class AdminCheckUserInfo {
  final String loginId;
  final String email;
  final String name;
  final String createDate;

  AdminCheckUserInfo({
    required this.loginId,
    required this.email,
    required this.name,
    required this.createDate,
  });

  factory AdminCheckUserInfo.fromJson(Map<String, dynamic> json) {
    return AdminCheckUserInfo(
      loginId: json['loginId'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      createDate: json['createDate'] ?? '',
    );
  }
}
