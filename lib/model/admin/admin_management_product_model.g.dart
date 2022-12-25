// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_management_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminManagementProductModel _$$_AdminManagementProductModelFromJson(
        Map<String, dynamic> json,) =>
    _$_AdminManagementProductModel(
      createDate: json['createDate'] as String? ?? '',
      modifiedDate: json['modifiedDate'] as String? ?? '',
      productId: json['productId'] as int? ?? 0,
      productState: json['productState'] as String? ?? '',
      productNameType: json['productNameType'] as String? ?? '',
      description: json['description'] as String? ?? '',
      productPrice: json['productPrice'] as int? ?? 0,
      productLabel: json['productLabel'] as String? ?? '',
      productNameTypeString: json['productNameTypeString'] as String? ?? '',
    );

Map<String, dynamic> _$$_AdminManagementProductModelToJson(
        _$_AdminManagementProductModel instance,) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'productId': instance.productId,
      'productState': instance.productState,
      'productNameType': instance.productNameType,
      'description': instance.description,
      'productPrice': instance.productPrice,
      'productLabel': instance.productLabel,
      'productNameTypeString': instance.productNameTypeString,
    };
