// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerState _$$_TimerStateFromJson(Map<String, dynamic> json) =>
    _$_TimerState(
      startTime: Duration(microseconds: json['startTime'] as int),
      timeLeft: json['timeLeft'] == null
          ? const Duration()
          : Duration(microseconds: json['timeLeft'] as int),
    );

Map<String, dynamic> _$$_TimerStateToJson(_$_TimerState instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.inMicroseconds,
      'timeLeft': instance.timeLeft.inMicroseconds,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$TimerStateNotifierHash() =>
    r'454d185d9e23af269761f11d4f20e3b0d948347f';

/// See also [TimerStateNotifier].
final timerStateNotifierProvider =
    AutoDisposeNotifierProvider<TimerStateNotifier, TimerState>(
  TimerStateNotifier.new,
  name: r'timerStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$TimerStateNotifierHash,
);
typedef TimerStateNotifierRef = AutoDisposeNotifierProviderRef<TimerState>;

abstract class _$TimerStateNotifier extends AutoDisposeNotifier<TimerState> {
  @override
  TimerState build();
}
