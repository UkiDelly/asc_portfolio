import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  const TimerState._();
  const factory TimerState({
    required Duration startTime,
    @Default(Duration()) Duration timeLeft,
  }) = _TimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}

@riverpod
class TimerStateNotifier extends _$TimerStateNotifier {
  @override
  TimerState build() {
    return const TimerState(startTime: Duration(seconds: 10));
  }

  Future<void> getTimerFromApi() async {}

  void updateTimeLeft(Duration timeLeft) {
    state = state.copyWith(timeLeft: timeLeft, startTime: timeLeft);
  }
}
