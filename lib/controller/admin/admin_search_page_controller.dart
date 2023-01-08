import '../../model/admin/check_user/admin_check_user_product.dart';
import '../../model/admin/check_user/admin_check_user_valid_ticket.dart';

class AdminSearchPageController {
  String loginId = '';
  String email = '';
  String name = '';
  String createDate = '';
  List<AdminCheckUserProduct> userProductList = [];
  AdminCheckUserValidTicket? adminCheckUserValidTicket;
}
