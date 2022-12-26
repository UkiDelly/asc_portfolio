// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_qr_and_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserQrAndNameModel _$UserQrAndNameModelFromJson(Map<String, dynamic> json) {
  return _UserQrAndNameModel.fromJson(json);
}

/// @nodoc
mixin _$UserQrAndNameModel {
  String get qrCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserQrAndNameModelCopyWith<UserQrAndNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQrAndNameModelCopyWith<$Res> {
  factory $UserQrAndNameModelCopyWith(
          UserQrAndNameModel value, $Res Function(UserQrAndNameModel) then) =
      _$UserQrAndNameModelCopyWithImpl<$Res, UserQrAndNameModel>;
  @useResult
  $Res call({String qrCode, String name});
}

/// @nodoc
class _$UserQrAndNameModelCopyWithImpl<$Res, $Val extends UserQrAndNameModel>
    implements $UserQrAndNameModelCopyWith<$Res> {
  _$UserQrAndNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserQrAndNameModelCopyWith<$Res>
    implements $UserQrAndNameModelCopyWith<$Res> {
  factory _$$_UserQrAndNameModelCopyWith(_$_UserQrAndNameModel value,
          $Res Function(_$_UserQrAndNameModel) then) =
      __$$_UserQrAndNameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qrCode, String name});
}

/// @nodoc
class __$$_UserQrAndNameModelCopyWithImpl<$Res>
    extends _$UserQrAndNameModelCopyWithImpl<$Res, _$_UserQrAndNameModel>
    implements _$$_UserQrAndNameModelCopyWith<$Res> {
  __$$_UserQrAndNameModelCopyWithImpl(
      _$_UserQrAndNameModel _value, $Res Function(_$_UserQrAndNameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? name = null,
  }) {
    return _then(_$_UserQrAndNameModel(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserQrAndNameModel extends _UserQrAndNameModel {
  const _$_UserQrAndNameModel({required this.qrCode, required this.name})
      : super._();

  factory _$_UserQrAndNameModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserQrAndNameModelFromJson(json);

  @override
  final String qrCode;
  @override
  final String name;

  @override
  String toString() {
    return 'UserQrAndNameModel(qrCode: $qrCode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserQrAndNameModel &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, qrCode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserQrAndNameModelCopyWith<_$_UserQrAndNameModel> get copyWith =>
      __$$_UserQrAndNameModelCopyWithImpl<_$_UserQrAndNameModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserQrAndNameModelToJson(
      this,
    );
  }
}

abstract class _UserQrAndNameModel extends UserQrAndNameModel {
  const factory _UserQrAndNameModel(
      {required final String qrCode,
      required final String name}) = _$_UserQrAndNameModel;
  const _UserQrAndNameModel._() : super._();

  factory _UserQrAndNameModel.fromJson(Map<String, dynamic> json) =
      _$_UserQrAndNameModel.fromJson;

  @override
  String get qrCode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserQrAndNameModelCopyWith<_$_UserQrAndNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
