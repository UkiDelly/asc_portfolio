import 'dart:convert';

import 'package:asc_portfolio/controller/InAppPayment_controller.dart';
import 'package:asc_portfolio/model/payment_data_model.dart';
import 'package:asc_portfolio/repository/payment_repository.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/config/bootpay_config.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/stat_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constant/enum/product/product_enum.dart';
import '../../../style/app_color.dart';
import '../payment_page.dart';

class InAppPaymentSecond extends ConsumerStatefulWidget {
  late Product product;

  InAppPaymentSecond({super.key, required this.product});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InAppPaymentSecondState();
}

class _InAppPaymentSecondState extends ConsumerState<InAppPaymentSecond> {
  Payload payload = Payload();
  InAppPaymentController inAppPaymentController = InAppPaymentController();

  late Product product = widget.product;

  String get applicationId {
    return Bootpay().applicationId(
      inAppPaymentController.webApplicationId,
      inAppPaymentController.androidApplicationId,
      inAppPaymentController.iosApplicationId,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bootpayAnalyticsUserTrace(); //통계용 함수 호출
    bootpayAnalyticsPageTrace(); //통계용 함수 호출
    bootpayReqeustDataInit(); //결제용 데이터 init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: const Text(
          '결제진행',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
        ),
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: FloatingActionButton.extended(
                      heroTag: 'Text2',
                      label: Text(
                        '${product.name} order 테스트',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ), // <-- Text
                      backgroundColor: AppColor.appPurple,
                      onPressed: () async {
                        ref.read(paymentRepoProvider).getPaymentConfirm('638af347cf9f6d001f64695e');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FloatingActionButton.extended(
                      heroTag: 'Text',
                      label: Text(
                        '${product.name} 결제진행',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ), // <-- Text
                      backgroundColor: AppColor.appPurple,
                      onPressed: () {
                        goBootpayTest(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ApiProvider provider = ApiProvider();
  //
  // User generateUser() {
  //   var user = User();
  //   user.id = '123411aaaaaaaaaaaabd4ss11';
  //   user.gender = 1;
  //   user.email = 'test1234@gmail.com';
  //   user.phone = '01012345678';
  //   user.birth = '19880610';
  //   user.username = '홍길동';
  //   user.area = '서울';
  //   return user;
  // }

  //통계용 함수
  bootpayAnalyticsUserTrace() async {
    await Bootpay().userTrace(
      // id: 'user_1234',
      // email: 'user1234@gmail.com',
      // gender: -1,
      // birth: '19941014',
      // area: '서울',
      applicationId: applicationId,
    );
  }

  //통계용 함수
  bootpayAnalyticsPageTrace() async {
    StatItem item1 = StatItem();
    item1.itemName = product.name; // 주문정보에 담길 상품명
    item1.unique = DateTime.now().millisecondsSinceEpoch.toString(); // 해당 상품의 고유 키
    item1.price = product.price; // 상품의 가격
    // item1.cat1 = '스터디카페';
    // item1.cat2 = '이용권';

    List<StatItem> items = [item1];

    await Bootpay().pageTrace(
      // url: 'main_1234',
      // pageType: 'sub_page_1234',
      applicationId: applicationId,
      //userId: 'user_1234',
      items: items,
    );
  }

  //결제용 데이터 init
  bootpayReqeustDataInit() {
    Item item1 = Item();
    item1.name = product.name;
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = product.label + DateTime.now().millisecondsSinceEpoch.toString(); // 해당 상품의 고유 키
    item1.price = product.price;

    List<Item> itemList = [item1];

    payload.webApplicationId = inAppPaymentController.webApplicationId; // web application id
    payload.androidApplicationId =
        inAppPaymentController.androidApplicationId; // android application id
    payload.iosApplicationId = inAppPaymentController.androidApplicationId; // ios application id

    payload.pg = '나이스페이';
    // payload.method = '카드';
    // payload.methods = ['카드', '휴대폰', '가상계좌', '계좌이체', '카카오페이'];
    payload.orderName = product.name; //결제할 상품명
    payload.price = product.price; //정기결제시 0 혹은 주석

    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    payload.metadata = {
      'callbackParam1': 'value12',
      'callbackParam2': 'value34',
      'callbackParam3': 'value56',
      'callbackParam4': 'value78',
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList; // 상품정보 배열

    // User user = User(); // 구매자 정보
    // user.username = "사용자 이름";
    // user.email = "user1234@gmail.com";
    // user.area = "서울";
    // // user.phone = "010-0000-0000";
    // user.addr = 'null';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';

    if (BootpayConfig.DEBUG) {
      payload.extra?.redirectUrl = 'https://dev-api.bootpay.co.kr/v2';
    }

    // extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    //payload.user = user;
    payload.items = itemList;
    payload.extra = extra;

    // payload.extra?.openType = "iframe";
  }

  //버튼클릭시 부트페이 결제요청 실행
  void goBootpayTest(BuildContext context) {
    if (kIsWeb) {
      payload.extra?.openType = 'iframe';
    }
    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
      },
      onError: (String data) {
        print('------- onError: $data');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
        //TODO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
      },
      onConfirmAsync: (String data) async {
        Map<String, dynamic> mapData = jsonDecode(data);
        var paymentDataDto = PaymendDataModel.fromJson(mapData);
        Map<String, dynamic> orderData = {
          'orderProduct': product.toString().substring(8),
          'orderPrice': product.price,
          'productLabel': product.label + DateTime.now().millisecondsSinceEpoch.toString(),
          'receiptOrderId': paymentDataDto.receiptOrderId,
        };
        // print(paymentString);
        ref.read(paymentRepoProvider).postProductReq(orderData);
        print('Order inserted by server');
        String cofirmCode =
            await ref.read(paymentRepoProvider).getPaymentConfirm(paymentDataDto.receiptOrderId);
        print('------- onConfirmAsync11: $data');
        if (cofirmCode == 'OK') {
          return true;
        }
        return false;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  Future<void> checkQtyFromServer(String data) async {
    //TODO 서버로부터 재고파악을 한다
    print('checkQtyFromServer start: $data');
    return Future.delayed(const Duration(seconds: 1), () {
      print('checkQtyFromServer end: $data');

      return true;
    });
  }
}

// {"event":"done",
// "data":{
//   "receipt_id":"63857361cf9f6d0027640b7a",
// "order_id":"1669690207557","price":100,
// "tax_free":0,
// "cancelled_price":0,
// "cancelled_tax_free":0,
// "order_name":"7일권",
// "company_name":"알라딘스터디카페",
// "gateway_url":"https://gw.bootpay.co.kr",
// "metadata":{},
// "sandbox":true,
// "pg":"나이스페이먼츠","method":"카드",
// "method_symbol":"card",
// "method_origin":"카드",
// "method_origin_symbol":"card",
// "purchased_at":"2022-11-29T11:54:40+09:00",
// "requested_at":"2022-11-29T11:50:09+09:00",
// "status_locale":"결제완료",
// "receipt_url":"https://door.bootpay.co.kr/receipt/OHprTnhueFluVC80MGhVWFVIQ1ErV3ExbjlFSzRZdS9iMVVNVnYrWnZLV0hO%0Adz09LS16d09OWXZXWmEwR25YS2Y0LS1LYWpRNThVMmJNZUhqenkxQ3piS1dR%0APT0%3D%0A",
// "status":1,
// "card_data":{
//    "tid":"nicepay00m01012211291154394198","card_approve_no":"30000016",
// "card_no":"94912107****8176",
// "card_interest":"0",
// "card_quota":"00",
// "card_company_code":"02",
// "card_company":"KB국민",
// "card_type":"체크",
// "card_owner_type":"개인",
// "point":0.0,
// "coupon":0.0,"
