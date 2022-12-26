import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_seat_model.freezed.dart';
part 'user_seat_model.g.dart';

@freezed
class UsersSeatModel with _$UsersSeatModel {
  const UsersSeatModel._();

  factory UsersSeatModel({
    required int seatNumber,
    required String seatState,
  }) = _UsersSeatModel;

  factory UsersSeatModel.fromJson(Map<String, dynamic> json) => _$UsersSeatModelFromJson(json);
}
