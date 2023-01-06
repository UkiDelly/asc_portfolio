import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_seat_model.dart';

class SeatState {
  int selectedIndex;
  List<UsersSeatModel> seatDatas;
  int seatReservationSeatNumber;
  int seatReservationStartTime;
  String seatReservationCreateDate;
  String seatReservationPeriod;
  String format;
  int seatReservationTimeInUse;

  SeatState({
    this.selectedIndex = 0,
    this.seatDatas = const [],
    this.seatReservationSeatNumber = 0,
    this.seatReservationStartTime = 0,
    this.seatReservationCreateDate = '',
    this.seatReservationPeriod = '',
    this.format = '',
    this.seatReservationTimeInUse = 0,
  });

  SeatState copyWith({
    int? selectedIndex,
    List<UsersSeatModel>? seatDatas,
    int? seatReservationSeatNumber,
    int? seatReservationStartTime,
    String? seatReservationCreateDate,
    String? seatReservationPeriod,
    String? format,
    int? seatReservationTimeInUse,
  }) {
    return SeatState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      seatDatas: seatDatas ?? this.seatDatas,
      seatReservationSeatNumber: seatReservationSeatNumber ?? this.seatReservationSeatNumber,
      seatReservationStartTime: seatReservationStartTime ?? this.seatReservationStartTime,
      seatReservationCreateDate: seatReservationCreateDate ?? this.seatReservationCreateDate,
      seatReservationPeriod: seatReservationPeriod ?? this.seatReservationPeriod,
      format: format ?? this.format,
      seatReservationTimeInUse: seatReservationTimeInUse ?? this.seatReservationTimeInUse,
    );
  }
}

final seatStateNotifierProvider = StateNotifierProvider<SeatStateNotifier, SeatState>((ref) {
  final seatRepository = ref.watch(seatRepoProvider);
  return SeatStateNotifier(seatRepository);
});

class SeatStateNotifier extends StateNotifier<SeatState> {
  final SeatRepository seatRepository;
  int _selectedIndex = 0;
  SeatStateNotifier(this.seatRepository) : super(SeatState()) {
    roomFetchGet();
  }

  get selectedIndex => _selectedIndex;
  set setSelectedIndex(int index) {
    _selectedIndex = index;

    state = state.copyWith(selectedIndex: index);
  }

  void roomFetchGet() async {
    final List<UsersSeatModel> rooms = await seatRepository.getAllRoomStateReq();
    state = state.copyWith(seatDatas: rooms);
  }

  bool getRoomState(int index) {
    final roomState = state.seatDatas[index].toJson();
    if (roomState.values.toString() == '(RESERVED)') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postSeatReservationStart(int seatNumber, int startTime) async {
    try {
      final bool result = await seatRepository.postSeatReservationStart(seatNumber, startTime);
      return result;
    } on DioError {
      return false;
    }
  }
}
