import 'package:asc_portfolio/server/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/user_seat_dto.dart';
import '../../dto/user_seat_reservation_info_dto.dart';
import '../api/api.dart';

final seatRepoProvider = Provider<SeatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SeatRepository(dio);
});

class SeatRepository {
  final Dio dio;

  SeatRepository(this.dio);

  Future<List<UserSeatDto>> getAllRoomStateReq() async {
    Response response;
    Dio dio = Dio();
    response = await dio.get(Api.API_USER_SEAT + Api.cafeName);
    List<UserSeatDto> rooms = (response.data).map<UserSeatDto>((json) {
      return UserSeatDto.fromJson(json);
    }).toList();
    return rooms;
  }

  Future<UserSeatReservationInfoDto> getUserSeatReservationInfo() async {
    Response response;

    print("좌석");
    print("TICKET=${Api.cafeName}");
    response = await dio.get(Api.API_USER_RESERVATION_INFO);
    print(response.data);
    var userSeatReservationInfo = UserSeatReservationInfoDto.fromJson(response.data);
    return userSeatReservationInfo;
  }

  Future<String> postSeatReservationStart(int seatNumber) async {
    Response response;

    response = await dio.post(Api.API_START_SEAT_RESERVATION + seatNumber.toString());
    print("reservationResponse=" + response.data);
    return response.data;
  }

  Future<String> postExitSeat() async {
    Response response;

    response = await dio.post(Api.API_EXIT_SEAT);
    print("exitResponse=" + response.data);
    return response.data;
  }

  Future<String> postAdminExitSeat(int seatNumber) async {
    Response response;

    response = await dio.post(Api.API_ADMIN_EXIT_SEAT + seatNumber.toString());
    print("exitResponse=" + response.data);
    return response.data;
  }
}
