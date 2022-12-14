import 'package:asc_portfolio/server/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/admin/admin_check_user_valid_ticket.dart';
import '../../dto/user_ticket_dto.dart';
import '../api/api.dart';

final ticketRepoProvider = Provider<TicketRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return TicketRepository(dio);
});

class TicketRepository {
  final Dio dio;

  TicketRepository(this.dio);

  Future<UserTicketDto> getUserTicketInfo() async {
    Response response;

    response = await dio.get(Api.API_USER_TICKET + Api.cafeName);
    print(response.data);
    var userTicketInfo = UserTicketDto.fromJson(response.data);
    return userTicketInfo;
  }

  Future<AdminCheckUserValidTicket> getAdminCheckUserValidTicket(
      String userLoginId, BuildContext context) async {
    Response response;

    response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_VALID_TICKET + userLoginId);
    print("validTicketresponseData=${response.data}");
    var adminCheckUserValidTicket = AdminCheckUserValidTicket.fromJson(response.data);
    return adminCheckUserValidTicket;
  }
}
