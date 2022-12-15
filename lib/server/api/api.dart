import 'dart:io';

import '../../constant/enum/cafe/cafe_name.dart';

class Api {
  const Api._();

  static String cafeName = CafeNameType.seoul.name;
  static const API_VERSION = 'v1';
  static final DOMAIN = Platform.isAndroid
      ? 'http://10.0.2.2:8080/api/$API_VERSION'
      : 'http://loacalhost:8080/api/$API_VERSION'; // 로컬 8080

  //user
  static final API_SIGN_UP = '$DOMAIN/user/signup';
  static final API_LOGIN = '$DOMAIN/user/login';
  static final API_USER_QR_AND_NAME = '$DOMAIN/user/qr-name';
  static final API_LOGIN_CHECK = '$DOMAIN/user/login-check';
  static final API_ADMIN_FIND_SPECIFIC_USER = '$DOMAIN/user/admin/check?userLoginId=';

  //seat
  static final API_USER_SEAT = '$DOMAIN/seat/';
  static final API_START_SEAT_RESERVATION = '$DOMAIN/seat/reservation/';
  static final API_EXIT_SEAT = '$DOMAIN/seat/exit';
  static final API_ADMIN_EXIT_SEAT = '$DOMAIN/seat/exit-admin/';

  //ticket
  static final API_USER_TICKET = '$DOMAIN/ticket/';
  static final API_ADMIN_CHECK_SPECIFIC_USER_VALID_TICKET =
      '$DOMAIN/ticket/admin/lookup?userLoginId=';

  //seatReservationInfo
  static final API_USER_RESERVATION_INFO = '$DOMAIN/seatReservationInfo/';

  //pay
  static final API_PRODUCT_PAY = '$DOMAIN/pay/order/';
  static final API_ORDER_CHECK = '$DOMAIN/pay/confirm?';

  //cafe
  static final API_CHANGE_CAFE = '$DOMAIN/cafe/change/';

  //product
  static final API_ADMINISTRATE_PRODUCT = '$DOMAIN/product/admin/management/start-time/';
  static final API_ADMIN_CHECK_SPECIFIC_USER_PRODUCT =
      '$DOMAIN/product/admin/management?userLoginId=';
  static final API_CANCEL_PRODUCT =
      '$DOMAIN/product/admin/management/cancel/product?product-label=';
}
