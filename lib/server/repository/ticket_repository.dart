import 'package:asc_portfolio/provider/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../model/admin/check_user/admin_check_user_valid_ticket.dart';
import '../../model/user_ticket_model.dart';
import '../api/api.dart';

final ticketRepoProvider = Provider<TicketRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return TicketRepository(dio);
});

class TicketRepository {
  final Dio dio;

  TicketRepository(this.dio);

  Future<UserTicketModel> getUserTicketInfo() async {
    Response response;

    response = await dio.get(Api.API_USER_TICKET + Api.cafeName);
    logger.i('유저 티켓 정보=${response.data}');
    if (response.data == null || response.data.isEmpty) {
      return const UserTicketModel(isValidTicket: 'false');
    }
    final userTicketInfo = UserTicketModel.fromJson(response.data);
    return userTicketInfo;
  }

  Future<AdminCheckUserValidTicket> getAdminCheckUserValidTicket(
    String userLoginId,
  ) async {
    Response response;

    response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_VALID_TICKET + userLoginId);
    logger.i('valid ticket of specific user for admin=${response.data}');
    var adminCheckUserValidTicket = AdminCheckUserValidTicket.fromJson(response.data);
    return adminCheckUserValidTicket;
  }
}
