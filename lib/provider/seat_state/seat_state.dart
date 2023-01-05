import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/user_seat_model.dart';

part 'seat_state.freezed.dart';

@freezed
class SeatState with _$SeatState {
  const SeatState._();

  factory SeatState({
    @Default(0) int selectedIndex,
    @Default([]) List<UsersSeatModel> seatDatas,
    @Default(0) int seatReservationSeatNumber,
    @Default(0) int seatReservationStartTime,
    @Default('') String seatReservationCreateDate,
    @Default('') String seatReservationPeriod,
    @Default('') String format,
    @Default(0) int seatReservationTimeInUse,
  }) = _SeatState;

  factory SeatState.fromJson(Map<String, dynamic> json) => _$SeatStateFromJson(json);
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
}
