import 'package:asc_portfolio/constant/enum/product/product_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ticket_model.freezed.dart';
part 'user_ticket_model.g.dart';

@freezed
class UserTicketModel with _$UserTicketModel {
  const UserTicketModel._();

  const factory UserTicketModel({
    required String isValidTicket,
    @Default('') String fixedTermTicket,
    @JsonKey(name: 'productLabel', fromJson: Product.getByCode)
    @Default(Product.UNDEFINED)
        Product productLabel,
    @Default(0) int partTimeTicket,
    @Default(0) int remainingTime,
    @Default(0) int period,
  }) = _UserTicketModel;

  factory UserTicketModel.fromJson(Map<String, dynamic> json) => _$UserTicketModelFromJson(json);
}
