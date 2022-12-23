import 'package:asc_portfolio/controller/home_controller.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:asc_portfolio/server/repository/ticket_repository.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeController>((ref) {
  final userRepository = ref.watch(userRepoProvider);
  final ticketRepository = ref.watch(ticketRepoProvider);
  final seatRepository = ref.watch(seatRepoProvider);
  return HomeStateNotifier(
    userRepository: userRepository,
    ticketRepository: ticketRepository,
    seatRepository: seatRepository,
  );
});

class HomeStateNotifier extends StateNotifier<HomeController> {
  final UserRepository userRepository;
  final TicketRepository ticketRepository;
  final SeatRepository seatRepository;
  HomeStateNotifier({
    required this.userRepository,
    required this.ticketRepository,
    required this.seatRepository,
  }) : super(HomeController()) {
    roomFetchGet();
    init();
  }

  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  set setSelectedIndex(int index) {
    _selectedIndex = index;

    state = state.copyWith(selectedIndex: index);
  }

  void logOut() {
    state = HomeController();
  }

  void init() async {
    final userLogin = await userRepository.getCheckLogin();

    if (userLogin) {
      final userQrandName = await userRepository.getUserQrAndNameReq();
      final userTicketInfo = await ticketRepository.getUserTicketInfo();

      // state = state.copyWith(
      //   loginCheck: userLogin,
      //   qrCode: userQrandName.qrCode,
      //   userName: userQrandName.name,
      //   userTicketInfo: userTicketInfo,
      //   // seatReservationSeatNumber: userSeatReservationInfo.seatNumber,
      //   // seatReservationStartTime: userSeatReservationInfo.startTime,
      //   // seatReservationCreateDate: userSeatReservationInfo.createDate,
      //   // seatReservationPeriod: userSeatReservationInfo.period,
      //   // seatReservationTimeInUse: userSeatReservationInfo.timeInUse,
      //   // format: DateFormat('HH시 mm분').format(
      //   //   DateTime.parse(state.seatReservationCreateDate).subtract(
      //   //     Duration(
      //   //       days: DateTime.now().day,
      //   //       hours: DateTime.now().hour,
      //   //       minutes: DateTime.now().minute,
      //   //     ),
      //   //   ),
      //   // ),
      // );

      // if the userTicketInfo.productLabel is 'FIXED-TERM' copy the period to state.period
      if (userTicketInfo.productLabel.label == 'PART-TIME') {
        state = state.copyWith(
          period: userTicketInfo.remainingTime,
          loginCheck: userLogin,
          qrCode: userQrandName.qrCode,
          userName: userQrandName.name,
          userTicketInfo: userTicketInfo,
        );
      } else if (userTicketInfo.productLabel.label == 'TIME-TERM') {
        state = state.copyWith(
          period: userTicketInfo.period,
          loginCheck: userLogin,
          qrCode: userQrandName.qrCode,
          userName: userQrandName.name,
          userTicketInfo: userTicketInfo,
        );
      } else {
        state = state.copyWith(
          loginCheck: userLogin,
          qrCode: userQrandName.qrCode,
          userName: userQrandName.name,
          userTicketInfo: userTicketInfo,
        );
      }

      // if (userTicketInfo.productLabel == Product.values) {
      //   state = state.copyWith(period: userTicketInfo.remainingTime);
      // } else if (userTicketInfo.productLabel.contains('FIXED-TERM')) {
      //   state = state.copyWith(period: userTicketInfo.period);
      // }

      print('_loginCheckAndFetch실행');
      print('seatReservationCreateDate=${state.seatReservationCreateDate}');
      print('seatReservationSeatNumber=${state.seatReservationSeatNumber}');
      print('seatReservationStartTime=${state.seatReservationStartTime}');
      print('seatReservationPeriod=${state.seatReservationPeriod}');
      print('userQrAndName=${state.qrCode}');
    } else {
      print('로그인 안됨');
    }
  }

  void roomFetchGet() async {
    final rooms = await seatRepository.getAllRoomStateReq();
    state = state.copyWith(seatDatas: rooms);
  }

  bool getRoomState(int index) {
    final roomState = state.seatDatas[index].toJson();
    if (roomState.values.toString() == '(RESERVED)') {
      print('seat:${roomState.values}');
      return true;
    } else {
      print('seat:${roomState.values}');
      return false;
    }
  }
}
