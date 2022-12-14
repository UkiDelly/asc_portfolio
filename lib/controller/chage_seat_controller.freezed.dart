// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chage_seat_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangeSeatController _$ChangeSeatControllerFromJson(Map<String, dynamic> json) {
  return _ChangeSeatController.fromJson(json);
}

/// @nodoc
mixin _$ChangeSeatController {
  List<UsersSeatModel> get seatDatas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeSeatControllerCopyWith<ChangeSeatController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeSeatControllerCopyWith<$Res> {
  factory $ChangeSeatControllerCopyWith(ChangeSeatController value,
          $Res Function(ChangeSeatController) then) =
      _$ChangeSeatControllerCopyWithImpl<$Res, ChangeSeatController>;
  @useResult
  $Res call({List<UsersSeatModel> seatDatas});
}

/// @nodoc
class _$ChangeSeatControllerCopyWithImpl<$Res,
        $Val extends ChangeSeatController>
    implements $ChangeSeatControllerCopyWith<$Res> {
  _$ChangeSeatControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatDatas = null,
  }) {
    return _then(_value.copyWith(
      seatDatas: null == seatDatas
          ? _value.seatDatas
          : seatDatas // ignore: cast_nullable_to_non_nullable
              as List<UsersSeatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeSeatControllerCopyWith<$Res>
    implements $ChangeSeatControllerCopyWith<$Res> {
  factory _$$_ChangeSeatControllerCopyWith(_$_ChangeSeatController value,
          $Res Function(_$_ChangeSeatController) then) =
      __$$_ChangeSeatControllerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UsersSeatModel> seatDatas});
}

/// @nodoc
class __$$_ChangeSeatControllerCopyWithImpl<$Res>
    extends _$ChangeSeatControllerCopyWithImpl<$Res, _$_ChangeSeatController>
    implements _$$_ChangeSeatControllerCopyWith<$Res> {
  __$$_ChangeSeatControllerCopyWithImpl(_$_ChangeSeatController _value,
      $Res Function(_$_ChangeSeatController) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatDatas = null,
  }) {
    return _then(_$_ChangeSeatController(
      seatDatas: null == seatDatas
          ? _value._seatDatas
          : seatDatas // ignore: cast_nullable_to_non_nullable
              as List<UsersSeatModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangeSeatController extends _ChangeSeatController {
  const _$_ChangeSeatController(
      {final List<UsersSeatModel> seatDatas = const []})
      : _seatDatas = seatDatas,
        super._();

  factory _$_ChangeSeatController.fromJson(Map<String, dynamic> json) =>
      _$$_ChangeSeatControllerFromJson(json);

  final List<UsersSeatModel> _seatDatas;
  @override
  @JsonKey()
  List<UsersSeatModel> get seatDatas {
    if (_seatDatas is EqualUnmodifiableListView) return _seatDatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seatDatas);
  }

  @override
  String toString() {
    return 'ChangeSeatController(seatDatas: $seatDatas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSeatController &&
            const DeepCollectionEquality()
                .equals(other._seatDatas, _seatDatas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_seatDatas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSeatControllerCopyWith<_$_ChangeSeatController> get copyWith =>
      __$$_ChangeSeatControllerCopyWithImpl<_$_ChangeSeatController>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangeSeatControllerToJson(
      this,
    );
  }
}

abstract class _ChangeSeatController extends ChangeSeatController {
  const factory _ChangeSeatController({final List<UsersSeatModel> seatDatas}) =
      _$_ChangeSeatController;
  const _ChangeSeatController._() : super._();

  factory _ChangeSeatController.fromJson(Map<String, dynamic> json) =
      _$_ChangeSeatController.fromJson;

  @override
  List<UsersSeatModel> get seatDatas;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeSeatControllerCopyWith<_$_ChangeSeatController> get copyWith =>
      throw _privateConstructorUsedError;
}
