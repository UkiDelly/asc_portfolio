// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymendDataModel _$PaymendDataModelFromJson(Map<String, dynamic> json) {
  return _PaymendDataModel.fromJson(json);
}

/// @nodoc
mixin _$PaymendDataModel {
  String get orderStateType => throw _privateConstructorUsedError;
  String get receiptOrderId => throw _privateConstructorUsedError;
  String get productLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymendDataModelCopyWith<PaymendDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymendDataModelCopyWith<$Res> {
  factory $PaymendDataModelCopyWith(
          PaymendDataModel value, $Res Function(PaymendDataModel) then) =
      _$PaymendDataModelCopyWithImpl<$Res, PaymendDataModel>;
  @useResult
  $Res call(
      {String orderStateType, String receiptOrderId, String productLabel});
}

/// @nodoc
class _$PaymendDataModelCopyWithImpl<$Res, $Val extends PaymendDataModel>
    implements $PaymendDataModelCopyWith<$Res> {
  _$PaymendDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStateType = null,
    Object? receiptOrderId = null,
    Object? productLabel = null,
  }) {
    return _then(_value.copyWith(
      orderStateType: null == orderStateType
          ? _value.orderStateType
          : orderStateType // ignore: cast_nullable_to_non_nullable
              as String,
      receiptOrderId: null == receiptOrderId
          ? _value.receiptOrderId
          : receiptOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productLabel: null == productLabel
          ? _value.productLabel
          : productLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymendDataModelCopyWith<$Res>
    implements $PaymendDataModelCopyWith<$Res> {
  factory _$$_PaymendDataModelCopyWith(
          _$_PaymendDataModel value, $Res Function(_$_PaymendDataModel) then) =
      __$$_PaymendDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderStateType, String receiptOrderId, String productLabel});
}

/// @nodoc
class __$$_PaymendDataModelCopyWithImpl<$Res>
    extends _$PaymendDataModelCopyWithImpl<$Res, _$_PaymendDataModel>
    implements _$$_PaymendDataModelCopyWith<$Res> {
  __$$_PaymendDataModelCopyWithImpl(
      _$_PaymendDataModel _value, $Res Function(_$_PaymendDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStateType = null,
    Object? receiptOrderId = null,
    Object? productLabel = null,
  }) {
    return _then(_$_PaymendDataModel(
      orderStateType: null == orderStateType
          ? _value.orderStateType
          : orderStateType // ignore: cast_nullable_to_non_nullable
              as String,
      receiptOrderId: null == receiptOrderId
          ? _value.receiptOrderId
          : receiptOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productLabel: null == productLabel
          ? _value.productLabel
          : productLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymendDataModel extends _PaymendDataModel {
  const _$_PaymendDataModel(
      {required this.orderStateType,
      required this.receiptOrderId,
      required this.productLabel})
      : super._();

  factory _$_PaymendDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymendDataModelFromJson(json);

  @override
  final String orderStateType;
  @override
  final String receiptOrderId;
  @override
  final String productLabel;

  @override
  String toString() {
    return 'PaymendDataModel(orderStateType: $orderStateType, receiptOrderId: $receiptOrderId, productLabel: $productLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymendDataModel &&
            (identical(other.orderStateType, orderStateType) ||
                other.orderStateType == orderStateType) &&
            (identical(other.receiptOrderId, receiptOrderId) ||
                other.receiptOrderId == receiptOrderId) &&
            (identical(other.productLabel, productLabel) ||
                other.productLabel == productLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderStateType, receiptOrderId, productLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymendDataModelCopyWith<_$_PaymendDataModel> get copyWith =>
      __$$_PaymendDataModelCopyWithImpl<_$_PaymendDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymendDataModelToJson(
      this,
    );
  }
}

abstract class _PaymendDataModel extends PaymendDataModel {
  const factory _PaymendDataModel(
      {required final String orderStateType,
      required final String receiptOrderId,
      required final String productLabel}) = _$_PaymendDataModel;
  const _PaymendDataModel._() : super._();

  factory _PaymendDataModel.fromJson(Map<String, dynamic> json) =
      _$_PaymendDataModel.fromJson;

  @override
  String get orderStateType;
  @override
  String get receiptOrderId;
  @override
  String get productLabel;
  @override
  @JsonKey(ignore: true)
  _$$_PaymendDataModelCopyWith<_$_PaymendDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
