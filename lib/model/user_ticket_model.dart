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

// Term type의 enum을 정의
// JsonValue를 사용하여 해당 값을 enum과 매핑
enum Term {
  @JsonValue('FIXED-TERM')
  fixedTerm,
  @JsonValue('PART-TIME')
  partTime,
  none;
}

// Term type의 enum을 String으로 변환하는 확장을 정의
extension TermExtension on Term {
  String enumToString() => _$TermEnumMap[this]!;
  // make a method to convert string to enum
  static Term stringToEnum(String? value) {
    if (value == null) {
      return Term.none;
    }
    return _$TermEnumMap.entries.firstWhere((element) => element.value == value).key;
  }
}
