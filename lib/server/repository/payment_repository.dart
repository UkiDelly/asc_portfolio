import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../api/api.dart';
import '../../provider/dio_provider.dart';

final paymentRepoProvider = Provider<PaymentRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PaymentRepository(dio);
});

class PaymentRepository {
  final Dio dio;

  PaymentRepository(this.dio);

  Future<dynamic> postProductReq(Map<String, dynamic> orderData) async {
    Response response;

    response = await dio.post(Api.API_PRODUCT_PAY, data: orderData);
    logger.i('주문 Data=${response.data}');
    return response.data;
  }

  Future<dynamic> getPaymentConfirm(String receiptId) async {
    Response response;

    response = await dio.get('${Api.API_ORDER_CHECK}receipt-id=$receiptId');
    logger.i('결제 검증 Data=${response.data}');
    return response.data;
  }

  Future<void> postChangeCafe(String cafeName) async {
    Response response;

    response = await dio.post(Api.API_CHANGE_CAFE + cafeName);
    logger.i('유저가 고른 카페=${response.data}');
  }
}
