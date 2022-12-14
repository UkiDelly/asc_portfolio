class AdminManagementProductDto {
  final String createDate;
  final String? modifiedDate;
  final int productId ;
  final String productState;
  final String productNameType;
  final String productNameTypeString;
  final String description;
  final int productPrice;
  final String productLabel;

  AdminManagementProductDto({
    required this.createDate, required this.modifiedDate, required this.productId,
    required this.productState, required this.productNameType,
    required this.description, required this.productPrice, required this.productLabel, required this.productNameTypeString});

  factory AdminManagementProductDto.fromJson(Map<String, dynamic> json) {
    return AdminManagementProductDto(
      createDate: json['createDate'] ?? '',
      modifiedDate: json['modifiedDate'] ?? '',
      productId: json['id'] ?? 0,
      productState : json['productState'] ?? '',
      productNameType : json['productNameType'] ?? '',
      description : json ['description'] ?? '',
      productPrice : json['productPrice'] ?? '',
      productLabel : json['productLabel'] ?? '',
      productNameTypeString: json['productNameTypeString'] ?? '',
    );
  }
}