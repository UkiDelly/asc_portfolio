import 'package:freezed_annotation/freezed_annotation.dart';

enum RoleType {
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin,
  none
}

extension RoleTypeExtension on RoleType {
  // make enum to string method
  String enumToString() {
    switch (this) {
      case RoleType.user:
        return 'USER';
      case RoleType.admin:
        return 'ADMIN';
      case RoleType.none:
        return 'none';
      default:
        return 'none';
    }
  }

  // make string to enum method
  static RoleType getRoleType(String type) {
    switch (type) {
      case 'USER':
        return RoleType.user;
      case 'ADMIN':
        return RoleType.admin;
      default:
        return RoleType.none;
    }
  }
}
