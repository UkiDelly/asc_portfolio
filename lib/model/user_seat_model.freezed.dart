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

UsersSeatModel _$UsersSeatModelFromJson(Map<String, dynamic> json) {
  return _UsersSeatModel.fromJson(json);
}

/// @nodoc
mixin _$UsersSeatModel {
  int get seatNumber => throw _privateConstructorUsedError;
  String get seatState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersSeatModelCopyWith<UsersSeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersSeatModelCopyWith<$Res> {
  factory $UsersSeatModelCopyWith(
          UsersSeatModel value, $Res Function(UsersSeatModel) then) =
      _$UsersSeatModelCopyWithImpl<$Res, UsersSeatModel>;
  @useResult
  $Res call({int seatNumber, String seatState});
}

/// @nodoc
class _$UsersSeatModelCopyWithImpl<$Res, $Val extends UsersSeatModel>
    implements $UsersSeatModelCopyWith<$Res> {
  _$UsersSeatModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_UsersSeatModelCopyWith<$Res>
    implements $UsersSeatModelCopyWith<$Res> {
  factory _$$_UsersSeatModelCopyWith(
          _$_UsersSeatModel value, $Res Function(_$_UsersSeatModel) then) =
      __$$_UsersSeatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int seatNumber, String seatState});
}

/// @nodoc
class __$$_UsersSeatModelCopyWithImpl<$Res>
    extends _$UsersSeatModelCopyWithImpl<$Res, _$_UsersSeatModel>
    implements _$$_UsersSeatModelCopyWith<$Res> {
  __$$_UsersSeatModelCopyWithImpl(
      _$_UsersSeatModel _value, $Res Function(_$_UsersSeatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatNumber = null,
    Object? seatState = null,
  }) {
    return _then(_$_UsersSeatModel(
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
class _$_UsersSeatModel extends _UsersSeatModel {
  _$_UsersSeatModel({required this.seatNumber, required this.seatState})
      : super._();

  factory _$_UsersSeatModel.fromJson(Map<String, dynamic> json) =>
      _$$_UsersSeatModelFromJson(json);

  @override
  final int seatNumber;
  @override
  final String seatState;

  @override
  String toString() {
    return 'UsersSeatModel(seatNumber: $seatNumber, seatState: $seatState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersSeatModel &&
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
  _$$_UsersSeatModelCopyWith<_$_UsersSeatModel> get copyWith =>
      __$$_UsersSeatModelCopyWithImpl<_$_UsersSeatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersSeatModelToJson(
      this,
    );
  }
}

abstract class _UsersSeatModel extends UsersSeatModel {
  factory _UsersSeatModel(
      {required final int seatNumber,
      required final String seatState}) = _$_UsersSeatModel;
  _UsersSeatModel._() : super._();

  factory _UsersSeatModel.fromJson(Map<String, dynamic> json) =
      _$_UsersSeatModel.fromJson;

  @override
  int get seatNumber;
  @override
  String get seatState;
  @override
  @JsonKey(ignore: true)
  _$$_UsersSeatModelCopyWith<_$_UsersSeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
