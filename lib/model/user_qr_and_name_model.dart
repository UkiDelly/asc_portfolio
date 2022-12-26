import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_qr_and_name_model.freezed.dart';
part 'user_qr_and_name_model.g.dart';

@freezed
class UserQrAndNameModel with _$UserQrAndNameModel {
  const UserQrAndNameModel._();

  const factory UserQrAndNameModel({
    required String qrCode,
    required String name,
  }) = _UserQrAndNameModel;

  factory UserQrAndNameModel.fromJson(Map<String, dynamic> json) =>
      _$UserQrAndNameModelFromJson(json);
}
