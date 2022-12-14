// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_seat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSeatModel _$UserSeatModelFromJson(Map<String, dynamic> json) {
  return _UserSeatModel.fromJson(json);
}

/// @nodoc
mixin _$UserSeatModel {
  int get seatNumber => throw _privateConstructorUsedError;
  String get seatState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSeatModelCopyWith<UserSeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSeatModelCopyWith<$Res> {
  factory $UserSeatModelCopyWith(
          UserSeatModel value, $Res Function(UserSeatModel) then) =
      _$UserSeatModelCopyWithImpl<$Res, UserSeatModel>;
  @useResult
  $Res call({int seatNumber, String seatState});
}

/// @nodoc
class _$UserSeatModelCopyWithImpl<$Res, $Val extends UserSeatModel>
    implements $UserSeatModelCopyWith<$Res> {
  _$UserSeatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatNumber = null,
    Object? seatState = null,
  }) {
    return _then(_value.copyWith(
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      seatState: null == seatState
          ? _value.seatState
          : seatState // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSeatModelCopyWith<$Res>
    implements $UserSeatModelCopyWith<$Res> {
  factory _$$_UserSeatModelCopyWith(
          _$_UserSeatModel value, $Res Function(_$_UserSeatModel) then) =
      __$$_UserSeatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int seatNumber, String seatState});
}

/// @nodoc
class __$$_UserSeatModelCopyWithImpl<$Res>
    extends _$UserSeatModelCopyWithImpl<$Res, _$_UserSeatModel>
    implements _$$_UserSeatModelCopyWith<$Res> {
  __$$_UserSeatModelCopyWithImpl(
      _$_UserSeatModel _value, $Res Function(_$_UserSeatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatNumber = null,
    Object? seatState = null,
  }) {
    return _then(_$_UserSeatModel(
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      seatState: null == seatState
          ? _value.seatState
          : seatState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSeatModel extends _UserSeatModel {
  const _$_UserSeatModel({required this.seatNumber, required this.seatState})
      : super._();

  factory _$_UserSeatModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserSeatModelFromJson(json);

  @override
  final int seatNumber;
  @override
  final String seatState;

  @override
  String toString() {
    return 'UserSeatModel(seatNumber: $seatNumber, seatState: $seatState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSeatModel &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.seatState, seatState) ||
                other.seatState == seatState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, seatNumber, seatState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSeatModelCopyWith<_$_UserSeatModel> get copyWith =>
      __$$_UserSeatModelCopyWithImpl<_$_UserSeatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSeatModelToJson(
      this,
    );
  }
}

abstract class _UserSeatModel extends UserSeatModel {
  const factory _UserSeatModel(
      {required final int seatNumber,
      required final String seatState}) = _$_UserSeatModel;
  const _UserSeatModel._() : super._();

  factory _UserSeatModel.fromJson(Map<String, dynamic> json) =
      _$_UserSeatModel.fromJson;

  @override
  int get seatNumber;
  @override
  String get seatState;
  @override
  @JsonKey(ignore: true)
  _$$_UserSeatModelCopyWith<_$_UserSeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
