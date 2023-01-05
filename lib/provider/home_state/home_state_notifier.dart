import 'package:asc_portfolio/controller/home_controller.dart';
import 'package:asc_portfolio/model/user_seat_model.dart';
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
  int _selectedIndex = 0;

  HomeStateNotifier({
    required this.userRepository,
    required this.ticketRepository,
    required this.seatRepository,
  }) : super(HomeController()) {
    // roomFetchGet();
    // init();
  }

  get selectedIndex => _selectedIndex;

  set setSelectedIndex(int index) {
    _selectedIndex = index;

    state = state.copyWith(selectedIndex: index);
  }

  // bool getRoomState(int index) {
  //   final roomState = state.seatDatas[index].toJson();
  //   if (roomState.values.toString() == '(RESERVED)') {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // void init() async {
  //   final userQrandName = await userRepository.getUserQrAndNameReq();
  //   final userTicketInfo = await ticketRepository.getUserTicketInfo();

  //   // if the userTicketInfo.productLabel is 'FIXED-TERM' copy the period to state.period
  //   if (userTicketInfo.productLabel.contains(Term.partTime.enumToString())) {
  //     state = state.copyWith(
  //       period: userTicketInfo.remainingTime,
  //       loginCheck: true,
  //       qrCode: userQrandName.qrCode,
  //       userName: userQrandName.name,
  //       userTicketInfo: userTicketInfo,
  //     );
  //   } else if (userTicketInfo.productLabel.contains(Term.fixedTerm.enumToString())) {
  //     state = state.copyWith(
  //       period: userTicketInfo.period,
  //       loginCheck: true,
  //       qrCode: userQrandName.qrCode,
  //       userName: userQrandName.name,
  //       userTicketInfo: userTicketInfo,
  //     );
  //   } else {
  //     state = state.copyWith(
  //       loginCheck: true,
  //       qrCode: userQrandName.qrCode,
  //       userName: userQrandName.name,
  //       userTicketInfo: userTicketInfo,
  //     );
  //   }

  //   // if (userTicketInfo.productLabel == Product.values) {
  //   //   state = state.copyWith(period: userTicketInfo.remainingTime);
  //   // } else if (userTicketInfo.productLabel.contains('FIXED-TERM')) {
  //   //   state = state.copyWith(period: userTicketInfo.period);
  //   // }

  //   // print('_loginCheckAndFetch실행');
  //   // print('seatReservationCreateDate=${state.seatReservationCreateDate}');
  //   // print('seatReservationSeatNumber=${state.seatReservationSeatNumber}');
  //   // print('seatReservationStartTime=${state.seatReservationStartTime}');
  //   // print('seatReservationPeriod=${state.seatReservationPeriod}');
  //   // print('userQrAndName=${state.qrCode}');
  // }

  void logOut() {
    state = HomeController();
  }

  // void roomFetchGet() async {
  //   final List<UsersSeatModel> rooms = await seatRepository.getAllRoomStateReq();
  //   state = state.copyWith(seatDatas: rooms);
  // }
}
