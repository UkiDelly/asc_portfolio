import 'package:asc_portfolio/controller/chage_seat_controller.dart';

class ChangeSeatService {

  bool getRoomState(int index, ChangeSeatController navDrawerController) {
    Map<int, String> state = navDrawerController.seatDatas[index].toJson();
    if(state.values.toString() == "(RESERVED)") {
      print("seat:"+state.values.toString());
      return true;
    } else {
      print("seat:"+state.values.toString());
      return false;
    }
  }
}