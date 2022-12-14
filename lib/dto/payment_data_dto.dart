class PaymentDataDto {
  final String orderStateType;
  final String receiptOrderId;
  final String productLabel;

  PaymentDataDto({required this.orderStateType, required this.receiptOrderId, required this.productLabel});

  factory PaymentDataDto.fromJson(Map<String, dynamic> json) {
    return PaymentDataDto(
        orderStateType: json['event'].toUpperCase(),
        receiptOrderId: json['receipt_id'],
        productLabel: json['order_id']
    );
  }
}
