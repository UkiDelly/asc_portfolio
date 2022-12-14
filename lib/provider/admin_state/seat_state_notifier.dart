import 'package:asc_portfolio/controller/chage_seat_controller.dart';
import 'package:asc_portfolio/repository/seat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seatStateProvider = StateNotifierProvider<SeateStateNotifier, ChangeSeatController>((ref) {
  final seatRepository = ref.watch(seatRepoProvider);
  return SeateStateNotifier(seatRepository);
});

class SeateStateNotifier extends StateNotifier<ChangeSeatController> {
  final SeatRepository seatRepository;
  SeateStateNotifier(this.seatRepository) : super(const ChangeSeatController());

  bool getRoomState(int index) {
    final getState = state.seatDatas[index].toJson();
    if (getState.values.toString() == '(RESERVED)') {
      print('seat:${getState.values}');
      return true;
    } else {
      print('seat:${getState.values}');
      return false;
    }
  }

  void getAllRoomStateReq() async {
    final roomDatas = await seatRepository.getAllRoomStateReq();
    state = state.copyWith(seatDatas: roomDatas);
  }
}
