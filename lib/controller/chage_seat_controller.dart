import 'package:asc_portfolio/model/user_seat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chage_seat_controller.freezed.dart';
part 'chage_seat_controller.g.dart';

@freezed
class ChangeSeatController with _$ChangeSeatController {
  const ChangeSeatController._();

  const factory ChangeSeatController({
   @Default([]) List<UsersSeatModel> seatDatas,
  }) = _ChangeSeatController;

  factory ChangeSeatController.fromJson(Map<String, dynamic> json) =>
      _$ChangeSeatControllerFromJson(json);
}
