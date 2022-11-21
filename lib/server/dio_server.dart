import 'package:asc_portfolio/dto/seat_dto.dart';
import 'package:asc_portfolio/dto/user_qr_and_name_dto.dart';
import 'package:asc_portfolio/dto/ticket_dto.dart';
import 'package:asc_portfolio/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_dio.dart';
import 'dart:convert';


const _API_SIGN_UP = "http://10.0.2.2:8080/user/signup";
const _API_LOGIN = "http://10.0.2.2:8080/user/login";
String _API_SEAT = "http://10.0.2.2:8080/api/v1/seat/${MyApp.cafeName}";
const _API_USER_QR_AND_NAME = "http://10.0.2.2:8080/user/api/v1";
const _API_LOGIN_CHECK = "http://10.0.2.2:8080/user/login-check";
String _API_USER_TICKET = "http://10.0.2.2:8080/api/v1/ticket/${MyApp.cafeName}";

class Server{

  static Map<String, String> loginData = {
  "loginId": "ascUser1234",
  "password": "ascUser1234",
  };

  static final storage = FlutterSecureStorage();

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
        .post(_API_SIGN_UP, data: data,);
  }

  Future<bool> getCheckLogin(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(_API_LOGIN_CHECK);
    if(response.statusCode == 200) {
      print(response.statusCode);
      return true;
    }
    return false;
  }


  Future<void> postReqLogin(BuildContext context) async {
    Response response;
    Dio dio = new Dio();
    Map<String, String> data = await loginData;
    response = await dio
        .post(_API_LOGIN, data: data);
    Map<String, dynamic> token = json.decode(response.data);
    print("logintoken="+token.toString());

    storage.write(key: token.keys.toString().replaceAll('(', '').replaceAll(')', ''), value: token.values.toString().replaceAll('(', '').replaceAll(')', ''));
  }

  Future<List<SeatDto>> getAllRoomStateReq(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(_API_SEAT);
    List<SeatDto> rooms = (response.data).map<SeatDto>((json) {
      return SeatDto.fromJson(json);
      }).toList();
    return rooms;
  }

  Future<List<UserQrAndNameDto>> getUserQrAndNameReq(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(_API_USER_QR_AND_NAME);
    List<UserQrAndNameDto> userQrAndName = (response.data).map<UserQrAndNameDto>((json) {
      return UserQrAndNameDto.fromJson(json);
    }).toList();
    return userQrAndName;
  }

  Future <TicketDto> getUserTicketInfo(BuildContext context) async {
    Response response;
    var dio = await authDio(context);
    response = await dio.get(_API_USER_TICKET);
    var userTicketInfo = TicketDto.fromJson(response.data);
    return userTicketInfo;
  }
}

Server server = Server();