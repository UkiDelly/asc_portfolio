// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminController _$$_AdminControllerFromJson(Map<String, dynamic> json) =>
    _$_AdminController(
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      oneHasPressed: json['oneHasPressed'] as bool? ?? true,
      weekHasPressed: json['weekHasPressed'] as bool? ?? false,
      monthHasPressed: json['monthHasPressed'] as bool? ?? false,
      selectHasPressed: json['selectHasPressed'] as bool? ?? false,
      title: json['title'] as String? ?? '',
      productList: (json['productList'] as List<dynamic>?)
              ?.map((e) => AdminManagementProductModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      oneDaySales: json['oneDaySales'] as int? ?? 0,
      oneDayProductList: (json['oneDayProductList'] as List<dynamic>?)
              ?.map((e) => AdminManagementProductModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      loginId: json['loginId'] as String? ?? '',
      seatDatas: (json['seatDatas'] as List<dynamic>?)
              ?.map((e) => UsersSeatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AdminControllerToJson(_$_AdminController instance) =>
    <String, dynamic>{
      'selectedIndex': instance.selectedIndex,
      'oneHasPressed': instance.oneHasPressed,
      'weekHasPressed': instance.weekHasPressed,
      'monthHasPressed': instance.monthHasPressed,
      'selectHasPressed': instance.selectHasPressed,
      'title': instance.title,
      'productList': instance.productList,
      'oneDaySales': instance.oneDaySales,
      'oneDayProductList': instance.oneDayProductList,
      'loginId': instance.loginId,
      'seatDatas': instance.seatDatas,
    };
