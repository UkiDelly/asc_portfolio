import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_data_model.freezed.dart';
part 'payment_data_model.g.dart';

@freezed
class PaymendDataModel with _$PaymendDataModel {
  const PaymendDataModel._();

  const factory PaymendDataModel({
    required String orderStateType,
    required String receiptOrderId,
    required String productLabel,
  }) = _PaymendDataModel;

  factory PaymendDataModel.fromJson(Map<String, dynamic> json) => _$PaymendDataModelFromJson(json);
}
