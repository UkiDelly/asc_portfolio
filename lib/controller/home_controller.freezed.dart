// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeController _$HomeControllerFromJson(Map<String, dynamic> json) {
  return _HomeController.fromJson(json);
}

/// @nodoc
mixin _$HomeController {
  UserTicketModel? get userTicketInfo => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get loginCheck => throw _privateConstructorUsedError;
  List<UsersSeatModel> get seatDatas => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  int get seatReservationSeatNumber => throw _privateConstructorUsedError;
  int get seatReservationStartTime => throw _privateConstructorUsedError;
  String get seatReservationCreateDate => throw _privateConstructorUsedError;
  String get seatReservationPeriod => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  int get seatReservationTimeInUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeControllerCopyWith<HomeController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeControllerCopyWith<$Res> {
  factory $HomeControllerCopyWith(
          HomeController value, $Res Function(HomeController) then) =
      _$HomeControllerCopyWithImpl<$Res, HomeController>;
  @useResult
  $Res call(
      {UserTicketModel? userTicketInfo,
      int period,
      int remainingTime,
      int selectedIndex,
      bool loginCheck,
      List<UsersSeatModel> seatDatas,
      String userName,
      String qrCode,
      int seatReservationSeatNumber,
      int seatReservationStartTime,
      String seatReservationCreateDate,
      String seatReservationPeriod,
      String format,
      int seatReservationTimeInUse});

  $UserTicketModelCopyWith<$Res>? get userTicketInfo;
}

/// @nodoc
class _$HomeControllerCopyWithImpl<$Res, $Val extends HomeController>
    implements $HomeControllerCopyWith<$Res> {
  _$HomeControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTicketInfo = freezed,
    Object? period = null,
    Object? remainingTime = null,
    Object? selectedIndex = null,
    Object? loginCheck = null,
    Object? seatDatas = null,
    Object? userName = null,
    Object? qrCode = null,
    Object? seatReservationSeatNumber = null,
    Object? seatReservationStartTime = null,
    Object? seatReservationCreateDate = null,
    Object? seatReservationPeriod = null,
    Object? format = null,
    Object? seatReservationTimeInUse = null,
  }) {
    return _then(_value.copyWith(
      userTicketInfo: freezed == userTicketInfo
          ? _value.userTicketInfo
          : userTicketInfo // ignore: cast_nullable_to_non_nullable
              as UserTicketModel?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loginCheck: null == loginCheck
          ? _value.loginCheck
          : loginCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      seatDatas: null == seatDatas
          ? _value.seatDatas
          : seatDatas // ignore: cast_nullable_to_non_nullable
              as List<UsersSeatModel>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationSeatNumber: null == seatReservationSeatNumber
          ? _value.seatReservationSeatNumber
          : seatReservationSeatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      seatReservationStartTime: null == seatReservationStartTime
          ? _value.seatReservationStartTime
          : seatReservationStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      seatReservationCreateDate: null == seatReservationCreateDate
          ? _value.seatReservationCreateDate
          : seatReservationCreateDate // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationPeriod: null == seatReservationPeriod
          ? _value.seatReservationPeriod
          : seatReservationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationTimeInUse: null == seatReservationTimeInUse
          ? _value.seatReservationTimeInUse
          : seatReservationTimeInUse // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTicketModelCopyWith<$Res>? get userTicketInfo {
    if (_value.userTicketInfo == null) {
      return null;
    }

    return $UserTicketModelCopyWith<$Res>(_value.userTicketInfo!, (value) {
      return _then(_value.copyWith(userTicketInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeControllerCopyWith<$Res>
    implements $HomeControllerCopyWith<$Res> {
  factory _$$_HomeControllerCopyWith(
          _$_HomeController value, $Res Function(_$_HomeController) then) =
      __$$_HomeControllerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserTicketModel? userTicketInfo,
      int period,
      int remainingTime,
      int selectedIndex,
      bool loginCheck,
      List<UsersSeatModel> seatDatas,
      String userName,
      String qrCode,
      int seatReservationSeatNumber,
      int seatReservationStartTime,
      String seatReservationCreateDate,
      String seatReservationPeriod,
      String format,
      int seatReservationTimeInUse});

  @override
  $UserTicketModelCopyWith<$Res>? get userTicketInfo;
}

/// @nodoc
class __$$_HomeControllerCopyWithImpl<$Res>
    extends _$HomeControllerCopyWithImpl<$Res, _$_HomeController>
    implements _$$_HomeControllerCopyWith<$Res> {
  __$$_HomeControllerCopyWithImpl(
      _$_HomeController _value, $Res Function(_$_HomeController) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTicketInfo = freezed,
    Object? period = null,
    Object? remainingTime = null,
    Object? selectedIndex = null,
    Object? loginCheck = null,
    Object? seatDatas = null,
    Object? userName = null,
    Object? qrCode = null,
    Object? seatReservationSeatNumber = null,
    Object? seatReservationStartTime = null,
    Object? seatReservationCreateDate = null,
    Object? seatReservationPeriod = null,
    Object? format = null,
    Object? seatReservationTimeInUse = null,
  }) {
    return _then(_$_HomeController(
      userTicketInfo: freezed == userTicketInfo
          ? _value.userTicketInfo
          : userTicketInfo // ignore: cast_nullable_to_non_nullable
              as UserTicketModel?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loginCheck: null == loginCheck
          ? _value.loginCheck
          : loginCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      seatDatas: null == seatDatas
          ? _value._seatDatas
          : seatDatas // ignore: cast_nullable_to_non_nullable
              as List<UsersSeatModel>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationSeatNumber: null == seatReservationSeatNumber
          ? _value.seatReservationSeatNumber
          : seatReservationSeatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      seatReservationStartTime: null == seatReservationStartTime
          ? _value.seatReservationStartTime
          : seatReservationStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      seatReservationCreateDate: null == seatReservationCreateDate
          ? _value.seatReservationCreateDate
          : seatReservationCreateDate // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationPeriod: null == seatReservationPeriod
          ? _value.seatReservationPeriod
          : seatReservationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      seatReservationTimeInUse: null == seatReservationTimeInUse
          ? _value.seatReservationTimeInUse
          : seatReservationTimeInUse // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeController extends _HomeController {
  _$_HomeController(
      {this.userTicketInfo,
      this.period = 0,
      this.remainingTime = 0,
      this.selectedIndex = 0,
      this.loginCheck = true,
      final List<UsersSeatModel> seatDatas = const [],
      this.userName = '',
      this.qrCode = '',
      this.seatReservationSeatNumber = 0,
      this.seatReservationStartTime = 0,
      this.seatReservationCreateDate = '',
      this.seatReservationPeriod = '',
      this.format = '',
      this.seatReservationTimeInUse = 0})
      : _seatDatas = seatDatas,
        super._();

  factory _$_HomeController.fromJson(Map<String, dynamic> json) =>
      _$$_HomeControllerFromJson(json);

  @override
  final UserTicketModel? userTicketInfo;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey()
  final int remainingTime;
  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool loginCheck;
  final List<UsersSeatModel> _seatDatas;
  @override
  @JsonKey()
  List<UsersSeatModel> get seatDatas {
    if (_seatDatas is EqualUnmodifiableListView) return _seatDatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seatDatas);
  }

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String qrCode;
  @override
  @JsonKey()
  final int seatReservationSeatNumber;
  @override
  @JsonKey()
  final int seatReservationStartTime;
  @override
  @JsonKey()
  final String seatReservationCreateDate;
  @override
  @JsonKey()
  final String seatReservationPeriod;
  @override
  @JsonKey()
  final String format;
  @override
  @JsonKey()
  final int seatReservationTimeInUse;

  @override
  String toString() {
    return 'HomeController(userTicketInfo: $userTicketInfo, period: $period, remainingTime: $remainingTime, selectedIndex: $selectedIndex, loginCheck: $loginCheck, seatDatas: $seatDatas, userName: $userName, qrCode: $qrCode, seatReservationSeatNumber: $seatReservationSeatNumber, seatReservationStartTime: $seatReservationStartTime, seatReservationCreateDate: $seatReservationCreateDate, seatReservationPeriod: $seatReservationPeriod, format: $format, seatReservationTimeInUse: $seatReservationTimeInUse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeController &&
            (identical(other.userTicketInfo, userTicketInfo) ||
                other.userTicketInfo == userTicketInfo) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.loginCheck, loginCheck) ||
                other.loginCheck == loginCheck) &&
            const DeepCollectionEquality()
                .equals(other._seatDatas, _seatDatas) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.seatReservationSeatNumber,
                    seatReservationSeatNumber) ||
                other.seatReservationSeatNumber == seatReservationSeatNumber) &&
            (identical(
                    other.seatReservationStartTime, seatReservationStartTime) ||
                other.seatReservationStartTime == seatReservationStartTime) &&
            (identical(other.seatReservationCreateDate,
                    seatReservationCreateDate) ||
                other.seatReservationCreateDate == seatReservationCreateDate) &&
            (identical(other.seatReservationPeriod, seatReservationPeriod) ||
                other.seatReservationPeriod == seatReservationPeriod) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(
                    other.seatReservationTimeInUse, seatReservationTimeInUse) ||
                other.seatReservationTimeInUse == seatReservationTimeInUse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userTicketInfo,
      period,
      remainingTime,
      selectedIndex,
      loginCheck,
      const DeepCollectionEquality().hash(_seatDatas),
      userName,
      qrCode,
      seatReservationSeatNumber,
      seatReservationStartTime,
      seatReservationCreateDate,
      seatReservationPeriod,
      format,
      seatReservationTimeInUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeControllerCopyWith<_$_HomeController> get copyWith =>
      __$$_HomeControllerCopyWithImpl<_$_HomeController>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeControllerToJson(
      this,
    );
  }
}

abstract class _HomeController extends HomeController {
  factory _HomeController(
      {final UserTicketModel? userTicketInfo,
      final int period,
      final int remainingTime,
      final int selectedIndex,
      final bool loginCheck,
      final List<UsersSeatModel> seatDatas,
      final String userName,
      final String qrCode,
      final int seatReservationSeatNumber,
      final int seatReservationStartTime,
      final String seatReservationCreateDate,
      final String seatReservationPeriod,
      final String format,
      final int seatReservationTimeInUse}) = _$_HomeController;
  _HomeController._() : super._();

  factory _HomeController.fromJson(Map<String, dynamic> json) =
      _$_HomeController.fromJson;

  @override
  UserTicketModel? get userTicketInfo;
  @override
  int get period;
  @override
  int get remainingTime;
  @override
  int get selectedIndex;
  @override
  bool get loginCheck;
  @override
  List<UsersSeatModel> get seatDatas;
  @override
  String get userName;
  @override
  String get qrCode;
  @override
  int get seatReservationSeatNumber;
  @override
  int get seatReservationStartTime;
  @override
  String get seatReservationCreateDate;
  @override
  String get seatReservationPeriod;
  @override
  String get format;
  @override
  int get seatReservationTimeInUse;
  @override
  @JsonKey(ignore: true)
  _$$_HomeControllerCopyWith<_$_HomeController> get copyWith =>
      throw _privateConstructorUsedError;
}
