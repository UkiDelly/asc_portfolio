import 'package:asc_portfolio/model/user_ticket_model.dart';

import '../model/user_seat_model.dart';

abstract class HomeControllerBase {}

class HomeController {
  UserTicketModel? userTicketInfo;
  int period = 0;
  int remainingTime = 0;
  int selectedIndex = 0;
  bool loginCheck = true;
  List<UserSeatModel> seatDatas = [];
  String userName = '';
  String qrCode = '';
  int seatReservationSeatNumber = 0;
  int seatReservationStartTime = 0;
  String seatReservationCreateDate = '';
  String seatReservationPeriod = '';
  String format = '';
  int seatReservationTimeInUse = 0;
}
