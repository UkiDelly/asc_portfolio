import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ticket_model.freezed.dart';
part 'user_ticket_model.g.dart';

@freezed
class UserTicketModel with _$UserTicketModel {
  const UserTicketModel._();

  const factory UserTicketModel({
    required String isValidTicket,
    @Default('') String fixedTermTicket,
    required Term productLabel,
    @Default(0) int partTimeTicket,
    @Default(0) int remainingTime,
    @Default(0) int period,
  }) = _UserTicketModel;

  factory UserTicketModel.fromJson(Map<String, dynamic> json) => _$UserTicketModelFromJson(json);
}

enum Term {
  @JsonValue('FIXED-TERM')
  fixedTerm,
  @JsonValue('PART-TIME')
  partTime,
  none;
}

extension TermExtension on Term {
  String enumToString() => _$TermEnumMap[this]!;
}
