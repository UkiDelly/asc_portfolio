import 'package:asc_portfolio/model/user_seat_model.dart';
import 'package:asc_portfolio/provider/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../api/api.dart';

part 'seat_repository.g.dart';

// final seatRepoProvider = Provider<SeatRepository>((ref) {
//   final dio = ref.watch(dioProvider);
//   return SeatRepository(dio);
// });

@Riverpod(keepAlive: true)
SeatRepository seatRepo(SeatRepoRef ref) {
  return SeatRepository(ref.watch(dioProvider));
}

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

  // 좌석시작, 좌석이동 API
  // startTime => 사용을 원하는 시간
  // startTime이 0이면 좌석이동요청 API
  Future<bool> postSeatReservationStart(int seatNumber, int startTime) async {
    try {
      Response response =
          await dio.post('${Api.API_START_SEAT_RESERVATION}?seat=$seatNumber&time=$startTime');
      logger.i('좌석 시작, 좌석 이동=${response.data}');
      return true;
    } on DioError {
      return false;
    }
  }

  Future<bool> postExitSeat() async {
    try {
      Response response = await dio.post(Api.API_EXIT_SEAT);
      logger.i('좌석 종료=${response.data}');
      return true;
    } on DioError {
      return false;
    }
  }

  Future<String> postAdminExitSeat(int seatNumber) async {
    Response response = await dio.post(
      Api.API_ADMIN_EXIT_SEAT + seatNumber.toString(),
    );

    logger.i('관리자 유저 좌석 강제 종료=${response.data}');
    return response.data;
  }
}
