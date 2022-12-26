import 'package:asc_portfolio/model/user_seat_model.dart';
import 'package:asc_portfolio/model/user_ticket_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_controller.freezed.dart';
part 'home_controller.g.dart';

@freezed
class HomeController with _$HomeController {
  const HomeController._();

  factory HomeController({
    UserTicketModel? userTicketInfo,
    @Default(0) int period,
    @Default(0) int remainingTime,
    @Default(0) int selectedIndex,
    @Default(false) bool loginCheck,
    @Default([]) List<UsersSeatModel> seatDatas,
    @Default('') String userName,
    @Default('') String qrCode,
    @Default(0) int seatReservationSeatNumber,
    @Default(0) int seatReservationStartTime,
    @Default('') String seatReservationCreateDate,
    @Default('') String seatReservationPeriod,
    @Default('') String format,
    @Default(0) int seatReservationTimeInUse,
  }) = _HomeController;

  factory HomeController.fromJson(Map<String, dynamic> json) => _$HomeControllerFromJson(json);
}
