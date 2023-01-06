// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerState _$TimerStateFromJson(Map<String, dynamic> json) {
  return _TimerState.fromJson(json);
}

/// @nodoc
mixin _$TimerState {
  Duration get startTime => throw _privateConstructorUsedError;
  Duration get timeLeft => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call({Duration startTime, Duration timeLeft});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? timeLeft = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerStateCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$_TimerStateCopyWith(
          _$_TimerState value, $Res Function(_$_TimerState) then) =
      __$$_TimerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration startTime, Duration timeLeft});
}

/// @nodoc
class __$$_TimerStateCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_TimerState>
    implements _$$_TimerStateCopyWith<$Res> {
  __$$_TimerStateCopyWithImpl(
      _$_TimerState _value, $Res Function(_$_TimerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? timeLeft = null,
  }) {
    return _then(_$_TimerState(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerState extends _TimerState {
  const _$_TimerState(
      {required this.startTime, this.timeLeft = const Duration()})
      : super._();

  factory _$_TimerState.fromJson(Map<String, dynamic> json) =>
      _$$_TimerStateFromJson(json);

  @override
  final Duration startTime;
  @override
  @JsonKey()
  final Duration timeLeft;

  @override
  String toString() {
    return 'TimerState(startTime: $startTime, timeLeft: $timeLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerState &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, timeLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerStateCopyWith<_$_TimerState> get copyWith =>
      __$$_TimerStateCopyWithImpl<_$_TimerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerStateToJson(
      this,
    );
  }
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {required final Duration startTime,
      final Duration timeLeft}) = _$_TimerState;
  const _TimerState._() : super._();

  factory _TimerState.fromJson(Map<String, dynamic> json) =
      _$_TimerState.fromJson;

  @override
  Duration get startTime;
  @override
  Duration get timeLeft;
  @override
  @JsonKey(ignore: true)
  _$$_TimerStateCopyWith<_$_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
