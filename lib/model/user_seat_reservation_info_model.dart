import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_seat_reservation_info_model.freezed.dart';
part 'user_seat_reservation_info_model.g.dart';

@freezed
class UserSeatResevationModel with _$UserSeatResevationModel {
  const UserSeatResevationModel._();

  const factory UserSeatResevationModel({
    required int seatNumber,
    required int startTime,
    required int timeInUse,
    required String createDate,
    required String period,
  }) = _UserSeatResevationModel;

  factory UserSeatResevationModel.fromJson(Map<String, dynamic> json) =>
      _$UserSeatResevationModelFromJson(json);
}
