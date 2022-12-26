import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/admin/admin_check_user_product.dart';
import '../../model/admin/admin_management_product_model.dart';
import '../../provider/dio_provider.dart';
import '../api/api.dart';

final productProvider = Provider<ProductRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductRepository(dio);
});

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<AdminManagementProductModel>> getProductInfoForAdmin(String dateString) async {
    Response response;

    response = await dio.get(
      Api.API_ADMINISTRATE_PRODUCT + Api.cafeName,
      options: Options(
        headers: <String, dynamic>{
          'dateString': dateString //
        },
      ),
    );
    print('getProductInfoForAdmin response.data = ${response.data}');
    List<AdminManagementProductModel> products =
        (response.data).map<AdminManagementProductModel>((json) {
      return AdminManagementProductModel.fromJson(json);
    }).toList();
    return products;
  }

  Future<List<AdminCheckUserProduct>> getAdminCheckUserProduct(String userLoginId) async {
    Response response;

    response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_PRODUCT + userLoginId);
    print('responseData=$response');
    List<AdminCheckUserProduct> adminCheckUserProduct =
        (response.data).map<AdminCheckUserProduct>((json) {
      return AdminCheckUserProduct.fromJson(json);
    }).toList();
    return adminCheckUserProduct;
  }

  Future<String> postCancelProduct(String productLabel) async {
    Response response;

    response = await dio.post('${Api.API_CANCEL_PRODUCT}receipt-id=$productLabel');
    print('cancelDatas=$response');
    return response.data;
  }
}
