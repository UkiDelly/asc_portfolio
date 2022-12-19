import '../../common_enum/cafe/cafe_name.dart';

class Api {
  static String cafeName = CafeNameType.seoul.name;
  static const API_VERSION = "v1";
  static const DOMAIN = "http://10.0.2.2:8080/api/$API_VERSION"; // 로컬 8080

  //user
  static const API_SIGN_UP = "$DOMAIN/user/signup";
  static const API_LOGIN = "$DOMAIN/user/login";
  static const API_USER_QR_AND_NAME = "$DOMAIN/user/qr-name";
  static const API_LOGIN_CHECK = "$DOMAIN/user/login-check";
  static const API_ADMIN_FIND_SPECIFIC_USER = "$DOMAIN/user/admin/check?userLoginId=";

  //seat
  static const API_USER_SEAT = "$DOMAIN/seat/";
  static const API_START_SEAT_RESERVATION = "$DOMAIN/seat/reservation/";
  static const API_EXIT_SEAT = "$DOMAIN/seat/exit";
  static const API_ADMIN_EXIT_SEAT = "$DOMAIN/seat/exit-admin/";
  static const API_USER_RESERVATION_INFO = "$DOMAIN/seat/one";

  //ticket
  static const API_USER_TICKET = "$DOMAIN/ticket/";
  static const API_ADMIN_CHECK_SPECIFIC_USER_VALID_TICKET = "$DOMAIN/ticket/admin/lookup?userLoginId=";

  //seatReservationInfo


  //pay
  static const API_PRODUCT_PAY = "$DOMAIN/pay/order/";
  static const API_ORDER_CHECK = "$DOMAIN/pay/confirm?";

  //cafe
  static const API_CHANGE_CAFE = "$DOMAIN/cafe/change/";

  //product
  static const API_ADMINISTRATE_PRODUCT = "$DOMAIN/product/admin/management/start-time/";
  static const API_ADMIN_CHECK_SPECIFIC_USER_PRODUCT = "$DOMAIN/product/admin/management?userLoginId=";
  static const API_CANCEL_PRODUCT = "$DOMAIN/product/admin/management/cancel/product?product-label=";
}

Api api = new Api();
