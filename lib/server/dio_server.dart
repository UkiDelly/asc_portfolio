import 'package:asc_portfolio/dto/admin/admin_management_product_dto.dart';
import 'package:asc_portfolio/dto/user_seat_dto.dart';
import 'package:asc_portfolio/dto/user_qr_and_name_dto.dart';
import 'package:asc_portfolio/dto/user_ticket_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:asc_portfolio/server/api/api.dart';
import '../dto/admin/admin_check_user_info.dart';
import '../dto/admin/admin_check_user_product.dart';
import '../dto/admin/admin_check_user_valid_ticket.dart';
import '../dto/token_dto.dart';
import '../dto/user_seat_reservation_info_dto.dart';
import 'auth_dio.dart';


class Server{

  static Map<String, String> loginAdminData = {
    "loginId": "adminuser",
    "password": "adminuser_password",
  };

  static Map<String, String> loginData = {
  "loginId": "tUser_A_login",
  "password": "tUser_A_password",
  };

  static final storage = FlutterSecureStorage();

  // user, signUp, login
  Future<void> postReqSignUp(String id, String password, String email, BuildContext context) async {
    Response response;
    Dio dio = new Dio();
    print(id); print(password); print(email.runtimeType);
    Map<String, dynamic> data =  await {
      "loginId": "hello1234",
      "password": "asdd1134",
      "email": "email@gmail.com",
      "name": null,
      "nickname": null
    };
    response = await dio
        .post(Api.API_SIGN_UP, data: data,);
  }

  Future<bool> getCheckLogin(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_LOGIN_CHECK);
    print("loginCheckResponseData="+response.data);
    if(response.data == "OK") {
      return true;
    }
    return false;
  }

  Future<void> postReqLogin(BuildContext context) async {
    Response response;
    Dio dio = new Dio();
    Map<String, String> data = loginData;
    response = await dio
        .post(Api.API_LOGIN, data: data);
    print(response.data);
    var tokenInfo = TokenDto.fromJson(response.data);
    storage.write(key: 'accessToken', value: tokenInfo.accessToken);
    storage.write(key: 'roleType', value: tokenInfo.roleType);
  }

  Future<UserQrAndNameDto> getUserQrAndNameReq(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_USER_QR_AND_NAME);
    var userQrAndName = UserQrAndNameDto.fromJson(response.data);
    return userQrAndName;
  }

  Future<AdminCheckUserInfo> getAdminCheckUserInfo(String userLoginId, BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    print("userLoginId="+userLoginId);
    response = await dio.get(Api.API_ADMIN_FIND_SPECIFIC_USER + userLoginId);
    print("responseData="+response.toString());
    var adminCheckUserInfo = AdminCheckUserInfo.fromJson(response.data);
    return adminCheckUserInfo;
  }

  // ticket

  Future<UserTicketDto> getUserTicketInfo(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_USER_TICKET + Api.cafeName);
    print(response.data);
    var userTicketInfo = UserTicketDto.fromJson(response.data);
    return userTicketInfo;
  }

  Future<AdminCheckUserValidTicket> getAdminCheckUserValidTicket(String userLoginId, BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_VALID_TICKET + userLoginId);
    print("validTicketresponseData="+response.data.toString());
    var adminCheckUserValidTicket = AdminCheckUserValidTicket.fromJson(response.data);
    return adminCheckUserValidTicket;
  }

  // seat

  Future<List<UserSeatDto>> getAllRoomStateReq(BuildContext context) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(Api.API_USER_SEAT + Api.cafeName);
    List<UserSeatDto> rooms = (response.data).map<UserSeatDto>((json) {
      return UserSeatDto.fromJson(json);
      }).toList();
    return rooms;
  }

  // seatReservationInfo

  Future<UserSeatReservationInfoDto> getUserSeatReservationInfo(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    print("좌석");
    print("TICKET="+Api.cafeName);
    response = await dio.get(Api.API_USER_RESERVATION_INFO);
    print(response.data);
    var userSeatReservationInfo = UserSeatReservationInfoDto.fromJson(response.data);
    return userSeatReservationInfo;
  }

  Future<String> postSeatReservationStart(BuildContext context, int seatNumber, int startTime) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_START_SEAT_RESERVATION + "?seat=" + seatNumber.toString() + "&time=" + startTime.toString());
    print("reservationResponse="+response.data);
    return response.data;
  }

  Future<String> postExitSeat(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_EXIT_SEAT);
    print("exitResponse="+response.data);
    return response.data;
  }

  Future<String> postAdminExitSeat(BuildContext context, int seatNumber) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_ADMIN_EXIT_SEAT + seatNumber.toString());
    print("exitResponse="+response.data);
    return response.data;
  }

  // product
  Future<List<AdminManagementProductDto>> getProductInfoForAdmin(BuildContext context, String dateString) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_ADMINISTRATE_PRODUCT + Api.cafeName,
        options: Options(headers: <String, dynamic>{
          'dateString' : dateString //
        }));
    print("getProductInfoForAdmin response.data = " + response.data.toString());
    List<AdminManagementProductDto> products = (response.data).map<AdminManagementProductDto>((json) {
      return AdminManagementProductDto.fromJson(json);
    }).toList();
    return products;
  }

  Future<List<AdminCheckUserProduct>> getAdminCheckUserProduct(String userLoginId, BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(Api.API_ADMIN_CHECK_SPECIFIC_USER_PRODUCT + userLoginId);
    print("responseData="+response.toString());
    List<AdminCheckUserProduct> adminCheckUserProduct = (response.data).map<AdminCheckUserProduct>((json) {
      return AdminCheckUserProduct.fromJson(json);
    }).toList();
    return adminCheckUserProduct;
  }

  Future<String> postCancelProduct(String productLabel, BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_CANCEL_PRODUCT + "receipt-id=$productLabel");
    print("cancelDatas="+response.toString());
    return response.data;
  }

  // payment

  Future<dynamic> postProductReq(Map<String, dynamic> orderData, BuildContext context) async {
    print("postProductReqStart");
    print(orderData);
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_PRODUCT_PAY, data: orderData);
    return response.data;
  }

  Future<dynamic> getPaymentConfirm(String receiptId, BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    print(receiptId);
    response = await dio.get(Api.API_ORDER_CHECK + "receipt-id=$receiptId");
    print(response);
    return response.data;
  }

  Future<void> postChangeCafe(BuildContext context, String cafeName) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.post(Api.API_CHANGE_CAFE + cafeName);
    print("cafeNameChange="+response.data);
  }
}

Server server = Server();