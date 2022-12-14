import 'package:asc_portfolio/provider/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_seat_model.dart';
import '../model/user_seat_reservation_info_model.dart';
import '../server/api/api.dart';

final seatRepoProvider = Provider<SeatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SeatRepository(dio);
});

class SeatRepository {
  final Dio dio;

  SeatRepository(this.dio);

  Future<List<UserSeatModel>> getAllRoomStateReq() async {
    Response response;
    Dio dio = Dio();
    response = await dio.get(Api.API_USER_SEAT + Api.cafeName);
    List<UserSeatModel> rooms = (response.data).map<UserSeatModel>((json) {
      return UserSeatModel.fromJson(json);
    }).toList();
    return rooms;
  }

  Future<UserSeatResevationModel> getUserSeatReservationInfo() async {
    Response response;

    print('좌석');
    print('TICKET=${Api.cafeName}');
    response = await dio.get(Api.API_USER_RESERVATION_INFO);
    print(response.data);
    var userSeatReservationInfo = UserSeatResevationModel.fromJson(response.data);
    return userSeatReservationInfo;
  }

  Future<String> postSeatReservationStart(int seatNumber) async {
    Response response;

    response = await dio.post(Api.API_START_SEAT_RESERVATION + seatNumber.toString());
    print('reservationResponse=' + response.data);
    return response.data;
  }

  Future<String> postExitSeat() async {
    Response response;

    response = await dio.post(Api.API_EXIT_SEAT);
    print('exitResponse=' + response.data);
    return response.data;
  }

  Future<String> postAdminExitSeat(int seatNumber) async {
    Response response;

    response = await dio.post(Api.API_ADMIN_EXIT_SEAT + seatNumber.toString());
    print('exitResponse=' + response.data);
    return response.data;
  }
}
