// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:asc_portfolio/constant/enum/user/user_enum.dart';
import 'package:asc_portfolio/model/admin/admin_check_user_info.dart';
import 'package:asc_portfolio/model/token_model.dart';
import 'package:asc_portfolio/model/user_qr_and_name_model.dart';
import 'package:asc_portfolio/provider/dio_provider.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../main.dart';
import '../api/api.dart';

final userRepoProvider = Provider<UserRepository>((ref) {
  final repository = UserRepository(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
  return repository;
});

class UserRepository {
  final Dio dio;
  final FlutterSecureStorage storage;

  UserRepository({
    required this.dio,
    required this.storage,
  });

  Map<String, String> loginAdminData = {
    'loginId': 'adminuser',
    'password': 'adminuser_password',
  };

  Map<String, String> loginData = {
    'loginId': 'tUser_B_login',
    'password': 'tUser_B_password',
  };

  Future<void> postReqSignUp(String id, String password, String email) async {
    Response response;

    print(id);
    print(password);
    print(email.runtimeType);
    Map<String, dynamic> data = {
      'loginId': 'hello1234',
      'password': 'asdd1134',
      'email': 'email@gmail.com',
      'name': null,
      'nickname': null
    };
    response = await dio.post(
      Api.API_SIGN_UP,
      data: data,
    );
  }

  Future<bool> getCheckLogin() async {
    try {
      Response response = await dio.get(Api.API_LOGIN_CHECK);
      return true;
    } on DioError {
      return false;
    }
  }

  Future<void> postReqLogin({required String id, required String password}) async {
    try {
      Response response = await dio.post(
        Api.API_LOGIN,
        data: {
          'loginId': id,
          'password': password,
        },
      );

      logger.i('login_data=${response.data}');

      final tokenInfo = TokenModel.fromJson(response.data);
      await storage.write(key: 'accessToken', value: tokenInfo.accessToken);
      await storage.write(key: 'roleType', value: tokenInfo.roleType.enumToString());
    } catch (e) {
      print(e);
    }
  }

  Future<UserQrAndNameModel> getUserQrAndNameReq() async {
    Response response = await dio.get(Api.API_USER_QR_AND_NAME);
    logger.i('유저 QR, 이름=${response.data}');
    final userQrAndName = UserQrAndNameModel.fromJson(response.data);
    return userQrAndName;
  }

  Future<AdminCheckUserInfo> getAdminCheckUserInfo(
    String userLoginId,
  ) async {
    Response response;
    response = await dio.get(Api.API_ADMIN_FIND_SPECIFIC_USER + userLoginId);
    logger.i('관리자 유저 체크= ${response.data}');
    var adminCheckUserInfo = AdminCheckUserInfo.fromJson(response.data);
    return adminCheckUserInfo;
  }
}
