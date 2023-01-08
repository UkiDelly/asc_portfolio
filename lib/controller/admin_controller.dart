import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/admin/product/admin_management_product_model.dart';
import '../model/user_seat_model.dart';

// class AdminController {
//   int selectedIndex = 0;
//   bool oneHasPressed = true;
//   bool weekHasPressed = false;
//   bool monthHasPressed = false;
//   bool selectHasPressed = false;
//   String title = '';
//   List<AdminManagementProductDto> productList = [];
//   int oneDaySales = 0;
//   List<AdminManagementProductDto> oneDayProductList = [];
//   String loginId = '';
//   List<UserSeatModel> seatDatas = [];
// }
part 'admin_controller.freezed.dart';
part 'admin_controller.g.dart';

@freezed
class AdminController with _$AdminController {
  const AdminController._();

  const factory AdminController({
    @Default(0) int selectedIndex,
    @Default(true) bool oneHasPressed,
    @Default(false) bool weekHasPressed,
    @Default(false) bool monthHasPressed,
    @Default(false) bool selectHasPressed,
    @Default('') String title,
    @Default([]) List<AdminManagementProductModel> productList,
    @Default(0) int oneDaySales,
    @Default([]) List<AdminManagementProductModel> oneDayProductList,
    @Default('') String loginId,
    @Default([]) List<UsersSeatModel> seatDatas,
  }) = _AdminController;

  factory AdminController.fromJson(Map<String, dynamic> json) => _$AdminControllerFromJson(json);
}
