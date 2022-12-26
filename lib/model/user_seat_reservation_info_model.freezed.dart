// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_seat_reservation_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSeatResevationModel _$UserSeatResevationModelFromJson(
    Map<String, dynamic> json) {
  return _UserSeatResevationModel.fromJson(json);
}

/// @nodoc
mixin _$UserSeatResevationModel {
  int get seatNumber => throw _privateConstructorUsedError;
  int get startTime => throw _privateConstructorUsedError;
  int get timeInUse => throw _privateConstructorUsedError;
  String get createDate => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSeatResevationModelCopyWith<UserSeatResevationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSeatResevationModelCopyWith<$Res> {
  factory $UserSeatResevationModelCopyWith(UserSeatResevationModel value,
          $Res Function(UserSeatResevationModel) then) =
      _$UserSeatResevationModelCopyWithImpl<$Res, UserSeatResevationModel>;
  @useResult
  $Res call(
      {int seatNumber,
      int startTime,
      int timeInUse,
      String createDate,
      String period});
}

/// @nodoc
class _$UserSeatResevationModelCopyWithImpl<$Res,
        $Val extends UserSeatResevationModel>
    implements $UserSeatResevationModelCopyWith<$Res> {
  _$UserSeatResevationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatNumber = null,
    Object? startTime = null,
    Object? timeInUse = null,
    Object? createDate = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      timeInUse: null == timeInUse
          ? _value.timeInUse
          : timeInUse // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSeatResevationModelCopyWith<$Res>
    implements $UserSeatResevationModelCopyWith<$Res> {
  factory _$$_UserSeatResevationModelCopyWith(_$_UserSeatResevationModel value,
          $Res Function(_$_UserSeatResevationModel) then) =
      __$$_UserSeatResevationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int seatNumber,
      int startTime,
      int timeInUse,
      String createDate,
      String period});
}

/// @nodoc
class __$$_UserSeatResevationModelCopyWithImpl<$Res>
    extends _$UserSeatResevationModelCopyWithImpl<$Res,
        _$_UserSeatResevationModel>
    implements _$$_UserSeatResevationModelCopyWith<$Res> {
  __$$_UserSeatResevationModelCopyWithImpl(_$_UserSeatResevationModel _value,
      $Res Function(_$_UserSeatResevationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatNumber = null,
    Object? startTime = null,
    Object? timeInUse = null,
    Object? createDate = null,
    Object? period = null,
  }) {
    return _then(_$_UserSeatResevationModel(
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      timeInUse: null == timeInUse
          ? _value.timeInUse
          : timeInUse // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSeatResevationModel extends _UserSeatResevationModel {
  const _$_UserSeatResevationModel(
      {required this.seatNumber,
      required this.startTime,
      required this.timeInUse,
      required this.createDate,
      required this.period})
      : super._();

  factory _$_UserSeatResevationModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserSeatResevationModelFromJson(json);

  @override
  final int seatNumber;
  @override
  final int startTime;
  @override
  final int timeInUse;
  @override
  final String createDate;
  @override
  final String period;

  @override
  String toString() {
    return 'UserSeatResevationModel(seatNumber: $seatNumber, startTime: $startTime, timeInUse: $timeInUse, createDate: $createDate, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSeatResevationModel &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timeInUse, timeInUse) ||
                other.timeInUse == timeInUse) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, seatNumber, startTime, timeInUse, createDate, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSeatResevationModelCopyWith<_$_UserSeatResevationModel>
      get copyWith =>
          __$$_UserSeatResevationModelCopyWithImpl<_$_UserSeatResevationModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSeatResevationModelToJson(
      this,
    );
  }
}

abstract class _UserSeatResevationModel extends UserSeatResevationModel {
  const factory _UserSeatResevationModel(
      {required final int seatNumber,
      required final int startTime,
      required final int timeInUse,
      required final String createDate,
      required final String period}) = _$_UserSeatResevationModel;
  const _UserSeatResevationModel._() : super._();

  factory _UserSeatResevationModel.fromJson(Map<String, dynamic> json) =
      _$_UserSeatResevationModel.fromJson;

  @override
  int get seatNumber;
  @override
  int get startTime;
  @override
  int get timeInUse;
  @override
  String get createDate;
  @override
  String get period;
  @override
  @JsonKey(ignore: true)
  _$$_UserSeatResevationModelCopyWith<_$_UserSeatResevationModel>
      get copyWith => throw _privateConstructorUsedError;
}
