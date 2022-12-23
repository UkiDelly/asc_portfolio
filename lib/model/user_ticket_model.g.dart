// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTicketModel _$$_UserTicketModelFromJson(Map<String, dynamic> json) =>
    _$_UserTicketModel(
      isValidTicket: json['isValidTicket'] as String,
      fixedTermTicket: json['fixedTermTicket'] as String? ?? '',
      productLabel: json['productLabel'] == null
          ? Product.UNDEFINED
          : Product.getByCode(json['productLabel'] as String),
      partTimeTicket: json['partTimeTicket'] as int? ?? 0,
      remainingTime: json['remainingTime'] as int? ?? 0,
      period: json['period'] as int? ?? 0,
    );

Map<String, dynamic> _$$_UserTicketModelToJson(_$_UserTicketModel instance) =>
    <String, dynamic>{
      'isValidTicket': instance.isValidTicket,
      'fixedTermTicket': instance.fixedTermTicket,
      'productLabel': _$ProductEnumMap[instance.productLabel]!,
      'partTimeTicket': instance.partTimeTicket,
      'remainingTime': instance.remainingTime,
      'period': instance.period,
    };

const _$ProductEnumMap = {
  Product.TODAY_FIXED_TERM_TICKET: 'TODAY_FIXED_TERM_TICKET',
  Product.WEEK_FIXED_TERM_TICKET: 'WEEK_FIXED_TERM_TICKET',
  Product.TWO_WEEK_FIXED_TERM_TICKET: 'TWO_WEEK_FIXED_TERM_TICKET',
  Product.THREE_WEEK_FIXED_TERM_TICKET: 'THREE_WEEK_FIXED_TERM_TICKET',
  Product.FOUR_WEEK_FIXED_TERM_TICKET: 'FOUR_WEEK_FIXED_TERM_TICKET',
  Product.ONE_HOUR_PART_TIME_TICKET: 'ONE_HOUR_PART_TIME_TICKET',
  Product.FOUR_HOUR_PART_TIME_TICKET: 'FOUR_HOUR_PART_TIME_TICKET',
  Product.TEN_HOUR_PART_TIME_TICKET: 'TEN_HOUR_PART_TIME_TICKET',
  Product.FIFTY_HOUR_PART_TIME_TICKET: 'FIFTY_HOUR_PART_TIME_TICKET',
  Product.HUNDRED_HOUR_PART_TIME_TICKET: 'HUNDRED_HOUR_PART_TIME_TICKET',
  Product.UNDEFINED: 'UNDEFINED',
};
