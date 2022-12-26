// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymendDataModel _$$_PaymendDataModelFromJson(Map<String, dynamic> json) =>
    _$_PaymendDataModel(
      orderStateType: json['orderStateType'] as String,
      receiptOrderId: json['receiptOrderId'] as String,
      productLabel: json['productLabel'] as String,
    );

Map<String, dynamic> _$$_PaymendDataModelToJson(_$_PaymendDataModel instance) =>
    <String, dynamic>{
      'orderStateType': instance.orderStateType,
      'receiptOrderId': instance.receiptOrderId,
      'productLabel': instance.productLabel,
    };
