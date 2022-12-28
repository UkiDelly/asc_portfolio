import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
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
    try {
      Response response = await dio.get(
        Api.API_ADMINISTRATE_PRODUCT + Api.cafeName,
        options: Options(
          headers: <String, dynamic>{
            'dateString': dateString //
            
          },
        ),
      );
      logger.i('getProductInfoForAdmin response.data=${response.data}');
      List<AdminManagementProductModel> products =
          (response.data).map<AdminManagementProductModel>((json) {
        return AdminManagementProductModel.fromJson(json);
      }).toList();
      return products;
    } on DioError catch (e) {
      logger.e('getProductInfoForAdmin error=${e.response}');
      return [];
    }
  }

  Future<List<AdminCheckUserProduct>> getAdminCheckUserProduct(String userLoginId) async {
    try {
      Response response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_PRODUCT + userLoginId);
      logger.i('getAdminCheckUserProduct Data=${response.data}');
      List<AdminCheckUserProduct> adminCheckUserProduct =
          (response.data).map<AdminCheckUserProduct>((json) {
        return AdminCheckUserProduct.fromJson(json);
      }).toList();
      return adminCheckUserProduct;
    } on DioError catch (e) {
      logger.e('getAdminCheckUserProduct error=${e.response}');
      return [];
    }
  }

  Future<String> postCancelProduct(String productLabel) async {
    try {
      Response response = await dio.post('${Api.API_CANCEL_PRODUCT}receipt-id=$productLabel');
      logger.i('cancelDatas=${response.data}');
      return response.data;
    } on DioError catch (e) {
      logger.e('cancelDatas error=${e.response}');
      return '';
    }
  }
}
