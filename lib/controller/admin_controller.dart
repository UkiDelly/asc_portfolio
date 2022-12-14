import '../dto/admin/admin_management_product_dto.dart';
import '../dto/user_seat_dto.dart';

class AdminController {
  int selectedIndex = 0;
  bool oneHasPressed = true;
  bool weekHasPressed = false;
  bool monthHasPressed = false;
  bool selectHasPressed = false;
  String title = "";
  List<AdminManagementProductDto> productList = [];
  int oneDaySales = 0;
  List<AdminManagementProductDto> oneDayProductList = [];
  String loginId = "";
  List<UserSeatDto> seatDatas = [];
}
