import 'package:asc_portfolio/controller/admin_controller.dart';

class AdminMainService {

  bool getRoomState(int index, AdminController adminController) {
    Map<int, String> state = adminController.seatDatas[index].toJson();
    if(state.values.toString() == "(RESERVED)") {
      print("seat:"+state.values.toString());
      return true;
    } else {
      print("seat:"+state.values.toString());
      return false;
    }
  }
}