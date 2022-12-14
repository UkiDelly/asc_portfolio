// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTicketModel _$UserTicketModelFromJson(Map<String, dynamic> json) {
  return _UserTicketModel.fromJson(json);
}

/// @nodoc
mixin _$UserTicketModel {
  String get isValidTicket => throw _privateConstructorUsedError;
  String get fixedTermTicket => throw _privateConstructorUsedError;
  String get productLabel => throw _privateConstructorUsedError;
  int get partTimeTicket => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTicketModelCopyWith<UserTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTicketModelCopyWith<$Res> {
  factory $UserTicketModelCopyWith(
          UserTicketModel value, $Res Function(UserTicketModel) then) =
      _$UserTicketModelCopyWithImpl<$Res, UserTicketModel>;
  @useResult
  $Res call(
      {String isValidTicket,
      String fixedTermTicket,
      String productLabel,
      int partTimeTicket,
      int remainingTime,
      int period});
}

/// @nodoc
class _$UserTicketModelCopyWithImpl<$Res, $Val extends UserTicketModel>
    implements $UserTicketModelCopyWith<$Res> {
  _$UserTicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValidTicket = null,
    Object? fixedTermTicket = null,
    Object? productLabel = null,
    Object? partTimeTicket = null,
    Object? remainingTime = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      isValidTicket: null == isValidTicket
          ? _value.isValidTicket
          : isValidTicket // ignore: cast_nullable_to_non_nullable
              as String,
      fixedTermTicket: null == fixedTermTicket
          ? _value.fixedTermTicket
          : fixedTermTicket // ignore: cast_nullable_to_non_nullable
              as String,
      productLabel: null == productLabel
          ? _value.productLabel
          : productLabel // ignore: cast_nullable_to_non_nullable
              as String,
      partTimeTicket: null == partTimeTicket
          ? _value.partTimeTicket
          : partTimeTicket // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserTicketModelCopyWith<$Res>
    implements $UserTicketModelCopyWith<$Res> {
  factory _$$_UserTicketModelCopyWith(
          _$_UserTicketModel value, $Res Function(_$_UserTicketModel) then) =
      __$$_UserTicketModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String isValidTicket,
      String fixedTermTicket,
      String productLabel,
      int partTimeTicket,
      int remainingTime,
      int period});
}

/// @nodoc
class __$$_UserTicketModelCopyWithImpl<$Res>
    extends _$UserTicketModelCopyWithImpl<$Res, _$_UserTicketModel>
    implements _$$_UserTicketModelCopyWith<$Res> {
  __$$_UserTicketModelCopyWithImpl(
      _$_UserTicketModel _value, $Res Function(_$_UserTicketModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValidTicket = null,
    Object? fixedTermTicket = null,
    Object? productLabel = null,
    Object? partTimeTicket = null,
    Object? remainingTime = null,
    Object? period = null,
  }) {
    return _then(_$_UserTicketModel(
      isValidTicket: null == isValidTicket
          ? _value.isValidTicket
          : isValidTicket // ignore: cast_nullable_to_non_nullable
              as String,
      fixedTermTicket: null == fixedTermTicket
          ? _value.fixedTermTicket
          : fixedTermTicket // ignore: cast_nullable_to_non_nullable
              as String,
      productLabel: null == productLabel
          ? _value.productLabel
          : productLabel // ignore: cast_nullable_to_non_nullable
              as String,
      partTimeTicket: null == partTimeTicket
          ? _value.partTimeTicket
          : partTimeTicket // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTicketModel extends _UserTicketModel {
  const _$_UserTicketModel(
      {required this.isValidTicket,
      this.fixedTermTicket = '',
      required this.productLabel,
      this.partTimeTicket = 0,
      this.remainingTime = 0,
      this.period = 0})
      : super._();

  factory _$_UserTicketModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserTicketModelFromJson(json);

  @override
  final String isValidTicket;
  @override
  @JsonKey()
  final String fixedTermTicket;
  @override
  final String productLabel;
  @override
  @JsonKey()
  final int partTimeTicket;
  @override
  @JsonKey()
  final int remainingTime;
  @override
  @JsonKey()
  final int period;

  @override
  String toString() {
    return 'UserTicketModel(isValidTicket: $isValidTicket, fixedTermTicket: $fixedTermTicket, productLabel: $productLabel, partTimeTicket: $partTimeTicket, remainingTime: $remainingTime, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTicketModel &&
            (identical(other.isValidTicket, isValidTicket) ||
                other.isValidTicket == isValidTicket) &&
            (identical(other.fixedTermTicket, fixedTermTicket) ||
                other.fixedTermTicket == fixedTermTicket) &&
            (identical(other.productLabel, productLabel) ||
                other.productLabel == productLabel) &&
            (identical(other.partTimeTicket, partTimeTicket) ||
                other.partTimeTicket == partTimeTicket) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isValidTicket, fixedTermTicket,
      productLabel, partTimeTicket, remainingTime, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTicketModelCopyWith<_$_UserTicketModel> get copyWith =>
      __$$_UserTicketModelCopyWithImpl<_$_UserTicketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTicketModelToJson(
      this,
    );
  }
}

abstract class _UserTicketModel extends UserTicketModel {
  const factory _UserTicketModel(
      {required final String isValidTicket,
      final String fixedTermTicket,
      required final String productLabel,
      final int partTimeTicket,
      final int remainingTime,
      final int period}) = _$_UserTicketModel;
  const _UserTicketModel._() : super._();

  factory _UserTicketModel.fromJson(Map<String, dynamic> json) =
      _$_UserTicketModel.fromJson;

  @override
  String get isValidTicket;
  @override
  String get fixedTermTicket;
  @override
  String get productLabel;
  @override
  int get partTimeTicket;
  @override
  int get remainingTime;
  @override
  int get period;
  @override
  @JsonKey(ignore: true)
  _$$_UserTicketModelCopyWith<_$_UserTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
