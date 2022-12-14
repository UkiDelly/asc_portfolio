import 'package:asc_portfolio/dto/user_ticket_dto.dart';
import 'package:asc_portfolio/server/dio_server.dart';
import '../dto/user_seat_dto.dart';



class HomeController {

  UserTicketDto? userTicketInfo;
  int period = 0;
  int remainingTime = 0;
  int selectedIndex = 0;
  bool loginCheck = true;
  List<UserSeatDto> seatDatas = [];
  String userName = '';
  String qrCode = "";
  int seatReservationSeatNumber = 0;
  int seatReservationStartTime = 0;
  String seatReservationCreateDate = '';
  String seatReservationPeriod = '';
  String format = '';
  int seatReservationTimeInUse = 0;

}