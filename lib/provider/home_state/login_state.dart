import 'package:asc_portfolio/model/user_ticket_model.dart';
import 'package:asc_portfolio/server/repository/ticket_repository.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../main.dart';
import '../../model/user_qr_and_name_model.dart';
import '../../server/api/api.dart';
import '../dio_provider.dart';

part 'login_state.freezed.dart';

final checkUserLoginProvider = FutureProvider<bool>((ref) async {
  final Dio dio = ref.watch(dioProvider);
  final UserRepository userRepository = ref.watch(userRepoProvider);
  final TicketRepository ticketRepository = ref.watch(ticketRepoProvider);
  try {
    Response response = await dio.get(Api.API_LOGIN_CHECK);
    logger.i('유저 로그인 체크=${response.data}');

    final qrCode = await userRepository.getUserQrAndNameReq();
    logger.i('유저 QR=${qrCode.name}, 이름=${qrCode.name}');

    final userTicket = await ticketRepository.getUserTicketInfo();
    logger.i('유저 티켓=${userTicket.toString()}');

    ref.read(loginStateProvider.notifier).setLoginCheck(true);
    ref.read(loginStateProvider.notifier).setQrCode(qrCode);
    ref.read(loginStateProvider.notifier).setTicket(userTicket);

    return true;
  } on DioError {
    return false;
  }
});

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loginCheck,
    UserQrAndNameModel? qrCode,
    UserTicketModel? ticket,
  }) = _LoginState;
}

final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  void setLoginCheck(bool loginCheck) {
    state = state.copyWith(loginCheck: loginCheck);
  }

  void setQrCode(UserQrAndNameModel qrCode) {
    state = state.copyWith(qrCode: qrCode);
  }

  void setTicket(UserTicketModel ticket) {
    state = state.copyWith(ticket: ticket);
  }

  void logout() {
    state = LoginState();
  }
}
