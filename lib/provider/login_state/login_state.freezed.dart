// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get loginCheck => throw _privateConstructorUsedError;
  UserQrAndNameModel? get qrCode => throw _privateConstructorUsedError;
  UserTicketModel? get ticket => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool loginCheck, UserQrAndNameModel? qrCode, UserTicketModel? ticket});

  $UserQrAndNameModelCopyWith<$Res>? get qrCode;
  $UserTicketModelCopyWith<$Res>? get ticket;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginCheck = null,
    Object? qrCode = freezed,
    Object? ticket = freezed,
  }) {
    return _then(_value.copyWith(
      loginCheck: null == loginCheck
          ? _value.loginCheck
          : loginCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as UserQrAndNameModel?,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as UserTicketModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserQrAndNameModelCopyWith<$Res>? get qrCode {
    if (_value.qrCode == null) {
      return null;
    }

    return $UserQrAndNameModelCopyWith<$Res>(_value.qrCode!, (value) {
      return _then(_value.copyWith(qrCode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTicketModelCopyWith<$Res>? get ticket {
    if (_value.ticket == null) {
      return null;
    }

    return $UserTicketModelCopyWith<$Res>(_value.ticket!, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loginCheck, UserQrAndNameModel? qrCode, UserTicketModel? ticket});

  @override
  $UserQrAndNameModelCopyWith<$Res>? get qrCode;
  @override
  $UserTicketModelCopyWith<$Res>? get ticket;
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginCheck = null,
    Object? qrCode = freezed,
    Object? ticket = freezed,
  }) {
    return _then(_$_LoginState(
      loginCheck: null == loginCheck
          ? _value.loginCheck
          : loginCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as UserQrAndNameModel?,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as UserTicketModel?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  _$_LoginState({this.loginCheck = false, this.qrCode, this.ticket});

  @override
  @JsonKey()
  final bool loginCheck;
  @override
  final UserQrAndNameModel? qrCode;
  @override
  final UserTicketModel? ticket;

  @override
  String toString() {
    return 'LoginState(loginCheck: $loginCheck, qrCode: $qrCode, ticket: $ticket)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.loginCheck, loginCheck) ||
                other.loginCheck == loginCheck) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.ticket, ticket) || other.ticket == ticket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginCheck, qrCode, ticket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final bool loginCheck,
      final UserQrAndNameModel? qrCode,
      final UserTicketModel? ticket}) = _$_LoginState;

  @override
  bool get loginCheck;
  @override
  UserQrAndNameModel? get qrCode;
  @override
  UserTicketModel? get ticket;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
