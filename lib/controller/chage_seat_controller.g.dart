// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chage_seat_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangeSeatController _$$_ChangeSeatControllerFromJson(
        Map<String, dynamic> json,) =>
    _$_ChangeSeatController(
      seatDatas: (json['seatDatas'] as List<dynamic>?)
              ?.map((e) => UsersSeatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ChangeSeatControllerToJson(
        _$_ChangeSeatController instance,) =>
    <String, dynamic>{
      'seatDatas': instance.seatDatas,
    };
