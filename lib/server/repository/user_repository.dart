// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:asc_portfolio/dto/admin/admin_check_user_info.dart';
import 'package:asc_portfolio/server/auth_dio.dart';
import 'package:asc_portfolio/server/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../dto/token_dto.dart';
import '../../dto/user_qr_and_name_dto.dart';
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

  static Map<String, String> loginAdminData = {
    "loginId": "adminuser",
    "password": "adminuser_password",
  };

  static Map<String, String> loginData = {
    "loginId": "tUser_B_login",
    "password": "tUser_B_password",
  };

  Future<void> postReqSignUp(String id, String password, String email) async {
    Response response;

    print(id);
    print(password);
    print(email.runtimeType);
    Map<String, dynamic> data = {
      "loginId": "hello1234",
      "password": "asdd1134",
      "email": "email@gmail.com",
      "name": null,
      "nickname": null
    };
    response = await dio.post(
      Api.API_SIGN_UP,
      data: data,
    );
  }

  Future<bool> getCheckLogin() async {
    Response response;

    response = await dio.get(Api.API_LOGIN_CHECK);
    print("loginCheckResponseData=" + response.data);
    if (response.data == "OK") {
      return true;
    }
    return false;
  }

  Future<void> postReqLogin() async {
    Response response;

    Map<String, String> data = loginData;
    response = await dio.post(Api.API_LOGIN, data: data);
    print(response.data);
    var tokenInfo = TokenDto.fromJson(response.data);
    storage.write(key: 'accessToken', value: tokenInfo.accessToken);
    storage.write(key: 'roleType', value: tokenInfo.roleType);
  }

  Future<UserQrAndNameDto> getUserQrAndNameReq() async {
    Response response = await dio.get(Api.API_USER_QR_AND_NAME);
    var userQrAndName = UserQrAndNameDto.fromJson(response.data);
    return userQrAndName;
  }

  Future<AdminCheckUserInfo> getAdminCheckUserInfo(
    String userLoginId,
  ) async {
    Response response;
    print("userLoginId=$userLoginId");
    response = await dio.get(Api.API_ADMIN_FIND_SPECIFIC_USER + userLoginId);
    print("responseData=$response");
    var adminCheckUserInfo = AdminCheckUserInfo.fromJson(response.data);
    return adminCheckUserInfo;
  }

  
}
