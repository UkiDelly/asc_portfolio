import 'dart:convert';

import 'package:asc_portfolio/server/parse/room.dart';
import 'package:asc_portfolio/server/parse/user_qr_and_name.dart';
import 'package:dio/dio.dart';

const _API_PREFIX = "http://10.0.2.2:8080/user/signup";
const _API_ROOM = "http://10.0.2.2:8080/api/v1/room";
const _API_USER_QR_AND_NAME = "http://10.0.2.2:8080/user/api/v1/33"; // 33 변경해야함

class Server{

  Future<void> postReqSignUp(String id, String password, String email) async {
    Response response;
    Dio dio = new Dio();



    print(id); print(password); print(email.runtimeType);
    Map<String, dynamic> data =  await {
      "loginId": id,
      "password": password,
      "email": email,
    };
    print(data);
    response = await dio
        .post(_API_PREFIX, data: data);
    print(data);
    print(response.data.toString());
  }


  Future<void> postReqTest2() async {
    Response response;
    Dio dio = new Dio();
    Map<String, String> data = {
      "loginId": "dioTest221",
      "password": "dioTest221",
      "email": "email@gmail.com",
    };
    response = await dio
        .post(_API_PREFIX, data: data);
    print(response.data.toString());
  }


  Future<void> postReq() async {
    Response response;
    Dio dio = new Dio();
    Map<String, dynamic> data = {
      "loginId": "dioTest221",
      "password": "dioTest11",
      "email": "email2@gmail.com"
    };
    response = await dio
        .post(_API_PREFIX, data: data);
    print(response.data.toString());
  }

  Future<List<Room>> getRoomReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_ROOM);
    List<Room> rooms = (response.data).map<Room>((json) {
      return Room.fromJson(json);
      }).toList();
    print(response.data.toString());
    return rooms;
  }

  Future<List<UserQrAndName>> getUserReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_USER_QR_AND_NAME);
    List<UserQrAndName> userQrAndName = (response.data).map<UserQrAndName>((json) {
      return UserQrAndName.fromJson(json);
    }).toList();
    print(response.data.toString());
    return userQrAndName;
  }

}

Server server = Server();