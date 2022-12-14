// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTicketModel _$$_UserTicketModelFromJson(Map<String, dynamic> json) =>
    _$_UserTicketModel(
      isValidTicket: json['isValidTicket'] as String,
      fixedTermTicket: json['fixedTermTicket'] as String? ?? '',
      productLabel: json['productLabel'] as String,
      partTimeTicket: json['partTimeTicket'] as int? ?? 0,
      remainingTime: json['remainingTime'] as int? ?? 0,
      period: json['period'] as int? ?? 0,
    );

Map<String, dynamic> _$$_UserTicketModelToJson(_$_UserTicketModel instance) =>
    <String, dynamic>{
      'isValidTicket': instance.isValidTicket,
      'fixedTermTicket': instance.fixedTermTicket,
      'productLabel': instance.productLabel,
      'partTimeTicket': instance.partTimeTicket,
      'remainingTime': instance.remainingTime,
      'period': instance.period,
    };
