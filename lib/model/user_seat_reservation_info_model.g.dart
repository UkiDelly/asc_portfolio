// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_seat_reservation_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSeatResevationModel _$$_UserSeatResevationModelFromJson(
        Map<String, dynamic> json,) =>
    _$_UserSeatResevationModel(
      seatNumber: json['seatNumber'] as int,
      startTime: json['startTime'] as int,
      timeInUse: json['timeInUse'] as int,
      createDate: json['createDate'] as String,
      period: json['period'] as String,
    );

Map<String, dynamic> _$$_UserSeatResevationModelToJson(
        _$_UserSeatResevationModel instance,) =>
    <String, dynamic>{
      'seatNumber': instance.seatNumber,
      'startTime': instance.startTime,
      'timeInUse': instance.timeInUse,
      'createDate': instance.createDate,
      'period': instance.period,
    };
