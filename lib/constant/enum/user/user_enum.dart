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
  String enumToString() => toString().split('.').last.toUpperCase();

  // make string to enum method
  static RoleType getRoleType(String type) => RoleType.values.firstWhere(
        (value) => value.enumToString() == type,
        orElse: () => RoleType.none,
      );
}
