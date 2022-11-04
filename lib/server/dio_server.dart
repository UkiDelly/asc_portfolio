import 'package:dio/dio.dart';

const _API_PREFIX = "http://10.0.2.2:8080/user/signup";

class Server{

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
}

Server server = Server();