import 'package:asc_portfolio/model/user_qr_and_name_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../server/api/api.dart';
import '../dio_provider.dart';

final getQrCodeProvider = FutureProvider<UserQrAndNameModel>((ref) async {
  final Dio dio = ref.watch(dioProvider);

  try {
    Response response = await dio.get(Api.API_USER_QR_AND_NAME);
    logger.i('유저 QR, 이름=${response.data}');
    final userQrAndName = UserQrAndNameModel.fromJson(response.data);
    return userQrAndName;
  } on DioError catch (e) {
    print(e);
    return const UserQrAndNameModel(qrCode: '', name: '');
  }
});
