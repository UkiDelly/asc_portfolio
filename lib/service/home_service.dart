import 'package:asc_portfolio/controller/home_controller.dart';

class HomeService {

  bool getRoomState(int index, HomeController homeController) {
    Map<int, String> state = homeController.seatDatas[index].toJson();
    if(state.values.toString() == "(RESERVED)") {
      print("seat:"+state.values.toString());
      return true;
    } else {
      print("seat:"+state.values.toString());
      return false;
    }
  }
}