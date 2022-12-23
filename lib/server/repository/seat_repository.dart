import 'package:asc_portfolio/model/user_seat_model.dart';
import 'package:asc_portfolio/provider/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api.dart';

final seatRepoProvider = Provider<SeatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SeatRepository(dio);
});

class SeatRepository {
  final Dio dio;

  SeatRepository(this.dio);

  Future<List<UsersSeatModel>> getAllRoomStateReq() async {
    Response response = await dio.get(Api.API_USER_SEAT + Api.cafeName);
    List<UsersSeatModel> rooms = (response.data).map<UsersSeatModel>((json) {
      return UsersSeatModel.fromJson(json);
    }).toList();
    return rooms;
  }

  Future<String> postSeatReservationStart(int seatNumber) async {
    Response response = await dio.post(Api.API_START_SEAT_RESERVATION + seatNumber.toString(),);
    print('reservationResponse=' + response.data);
    return response.data;
  }

  Future<String> postExitSeat() async {
    Response response = await dio.post(Api.API_EXIT_SEAT);
    print('exitResponse=' + response.data);
    return response.data;
  }

  Future<String> postAdminExitSeat(int seatNumber) async {
    Response response = await dio.post(Api.API_ADMIN_EXIT_SEAT + seatNumber.toString(),);
    print('exitResponse=' + response.data);
    return response.data;
  }
}
