import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_seat_model.freezed.dart';
part 'user_seat_model.g.dart';

@freezed
class UserSeatModel with _$UserSeatModel {
  const UserSeatModel._();

  const factory UserSeatModel({
    required int seatNumber,
    required String seatState,
  }) = _UserSeatModel;

  factory UserSeatModel.fromJson(Map<String, dynamic> json) => _$UserSeatModelFromJson(json);
}
