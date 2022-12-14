// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeController _$$_HomeControllerFromJson(Map<String, dynamic> json) =>
    _$_HomeController(
      userTicketInfo: json['userTicketInfo'] == null
          ? null
          : UserTicketModel.fromJson(
              json['userTicketInfo'] as Map<String, dynamic>),
      period: json['period'] as int? ?? 0,
      remainingTime: json['remainingTime'] as int? ?? 0,
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      loginCheck: json['loginCheck'] as bool? ?? true,
      seatDatas: (json['seatDatas'] as List<dynamic>?)
              ?.map((e) => UsersSeatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userName: json['userName'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
      seatReservationSeatNumber: json['seatReservationSeatNumber'] as int? ?? 0,
      seatReservationStartTime: json['seatReservationStartTime'] as int? ?? 0,
      seatReservationCreateDate:
          json['seatReservationCreateDate'] as String? ?? '',
      seatReservationPeriod: json['seatReservationPeriod'] as String? ?? '',
      format: json['format'] as String? ?? '',
      seatReservationTimeInUse: json['seatReservationTimeInUse'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HomeControllerToJson(_$_HomeController instance) =>
    <String, dynamic>{
      'userTicketInfo': instance.userTicketInfo,
      'period': instance.period,
      'remainingTime': instance.remainingTime,
      'selectedIndex': instance.selectedIndex,
      'loginCheck': instance.loginCheck,
      'seatDatas': instance.seatDatas,
      'userName': instance.userName,
      'qrCode': instance.qrCode,
      'seatReservationSeatNumber': instance.seatReservationSeatNumber,
      'seatReservationStartTime': instance.seatReservationStartTime,
      'seatReservationCreateDate': instance.seatReservationCreateDate,
      'seatReservationPeriod': instance.seatReservationPeriod,
      'format': instance.format,
      'seatReservationTimeInUse': instance.seatReservationTimeInUse,
    };
