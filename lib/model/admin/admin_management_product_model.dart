import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_management_product_model.freezed.dart';
part 'admin_management_product_model.g.dart';

@freezed
class AdminManagementProductModel with _$AdminManagementProductModel {
  const AdminManagementProductModel._();

  const factory AdminManagementProductModel({
    required String createDate,
    required String modifiedDate,
    required int productId,
    required String productState,
    required String productNameType,
    required String description,
    required int productPrice,
    required String productLabel,
    required String productNameTypeString,
  }) = _AdminManagementProductModel;

  factory AdminManagementProductModel.fromJson(Map<String, dynamic> json) =>
      _$AdminManagementProductModelFromJson(json);
}
