import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../server/api/api.dart';
import '../provider/dio_provider.dart';

final paymentRepoProvider = Provider<PaymentRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PaymentRepository(dio);
});

class PaymentRepository {
  final Dio dio;

  PaymentRepository(this.dio);

  Future<dynamic> postProductReq(Map<String, dynamic> orderData) async {
    print("postProductReqStart");
    print(orderData);
    Response response;

    response = await dio.post(Api.API_PRODUCT_PAY, data: orderData);
    return response.data;
  }

  Future<dynamic> getPaymentConfirm(String receiptId) async {
    Response response;

    print(receiptId);
    response = await dio.get("${Api.API_ORDER_CHECK}receipt-id=$receiptId");
    print(response);
    return response.data;
  }

  Future<void> postChangeCafe(String cafeName) async {
    Response response;

    response = await dio.post(Api.API_CHANGE_CAFE + cafeName);
    print("cafeNameChange=" + response.data);
  }
}
