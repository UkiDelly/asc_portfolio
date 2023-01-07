import 'package:asc_portfolio/controller/chage_seat_controller.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seat_state_notifier.g.dart';

@riverpod
class SeatStateNotifier extends _$SeatStateNotifier {
  late final SeatRepository seatRepository;
  @override
  ChangeSeatController build() {
    seatRepository = ref.watch(seatRepoProvider);
    return const ChangeSeatController();
  }

  bool getRoomState(int index) {
    final getState = state.seatDatas[index].toJson();
    if (getState.values.toString() == '(RESERVED)') {
      return true;
    } else {
      return false;
    }
  }

  void getAllRoomStateReq() async {
    final roomDatas = await seatRepository.getAllRoomStateReq();
    state = state.copyWith(seatDatas: roomDatas);
  }
}

// final seatStateProvider = StateNotifierProvider<SeateStateNotifier, ChangeSeatController>((ref) {
//   final seatRepository = ref.watch(seatRepoProvider);
//   return SeateStateNotifier(seatRepository);
// });

// class SeateStateNotifier extends StateNotifier<ChangeSeatController> {
//   final SeatRepository seatRepository;
//   SeateStateNotifier(this.seatRepository) : super(const ChangeSeatController());

//   bool getRoomState(int index) {
//     final getState = state.seatDatas[index].toJson();
//     if (getState.values.toString() == '(RESERVED)') {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void getAllRoomStateReq() async {
//     final roomDatas = await seatRepository.getAllRoomStateReq();
//     state = state.copyWith(seatDatas: roomDatas);
//   }
// }
