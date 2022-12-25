import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_management_product_model.freezed.dart';
part 'admin_management_product_model.g.dart';

@freezed
class AdminManagementProductModel with _$AdminManagementProductModel {
  const AdminManagementProductModel._();

  const factory AdminManagementProductModel({
    @Default('') String createDate,
    @Default('') String modifiedDate,
    @Default(0) int productId,
    @Default('') String productState,
    @Default('') String productNameType,
    @Default('') String description,
    @Default(0) int productPrice,
    @Default('') String productLabel,
    @Default('') String productNameTypeString,
  }) = _AdminManagementProductModel;

  factory AdminManagementProductModel.fromJson(Map<String, dynamic> json) =>
      _$AdminManagementProductModelFromJson(json);
}
