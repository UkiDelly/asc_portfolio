class AdminCheckUserProduct {
  final String productState;
  final String productNameType;
  final String productNameTypeString;
  final String description;
  final int productPrice;
  final String productLabel;
  final String createDate;

  AdminCheckUserProduct({
    required this.productState,
    required this.productNameType,
    required this.productNameTypeString,
    required this.description,
    required this.productPrice,
    required this.productLabel,
    required this.createDate,
  });

  factory AdminCheckUserProduct.fromJson(Map<String, dynamic> json) {
    return AdminCheckUserProduct(
      productState: json['productState'] ?? '',
      productNameType: json['productNameType'] ?? '',
      productNameTypeString: json['productNameTypeString'] ?? '',
      description: json['description'] ?? '',
      productPrice: json['productPrice'] ?? 0,
      productLabel: json['productLabel'] ?? '',
      createDate: json['createDate'] ?? '',
    );
  }
}
