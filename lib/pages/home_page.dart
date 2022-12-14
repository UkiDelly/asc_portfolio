import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/constant/enum/product/product_enum.dart';
import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/pages/nav_drawer/nav_drawer_page.dart';
import 'package:asc_portfolio/pages/payment/in_app_payment/in_app_payment.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:asc_portfolio/pages/seat/specific_seat_page.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';

import '../server/api/api.dart';
import 'login/login_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  late bool isLogined = ref.watch(homeStateProvider.notifier).isLogin;
  String rolyType = '';
  late int selectedSeatNumber = ref.watch(homeStateProvider.notifier).selectedIndex;

  // final HomeController _homeController = HomeController();
  late final homeController = ref.watch(homeStateProvider);
  late final storage = ref.read(secureStorageProvider);

  void getRolyType() async {
    String? rolyType = await storage.read(key: 'roleType');
    setState(() {
      rolyType = rolyType ?? '';
    });
    if (rolyType == 'ADMIN') {
      Navigator.popAndPushNamed(context, '/AdminMainPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    List seatList = [];
    // String parse = DateFormat('yyyy MM dd일 HH시 mm분').format(DateTime.now().add(
    //     Duration(
    //         hours: 9,
    //         minutes: _homeController.period
    //     ))
    //     .subtract(
    //     Duration(
    //         days: DateTime.now().day,
    //         hours: DateTime.now().hour + 9,
    //         minutes: DateTime.now().minute)));
    //
    // print("pares="+parse);

    print('DateTime=${DateTime.now()}');
    //.replaceAll(' ', '').replaceAll('-', '').replaceAll(':', '').replaceAll('.', '')
    String validTime = DateFormat('yyyy-MM-dd h시 mm분까지')
        .format(DateTime.now().add(Duration(hours: 9, minutes: homeController.period)));
    for (int i = 0; i < homeController.seatDatas.length; i++) {
      seatList.add(homeController.seatDatas[i].toJson());
    }

    List widgetOptions = [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: AppColor.appPurple,
              child: Image.asset(
                AppAssets.splashLogo,
                width: 200,
                height: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                heroTag: 'Text2',
                label: Text(
                  Api.cafeName,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                heroTag: 'Text4',
                label: const Text(
                  '관리자페이지 테스트',
                  style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminMainPage()),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                heroTag: 'Text5',
                label: const Text(
                  '결제 테스트',
                  style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InAppPaymentSecond(
                        product: Product.FIFTY_HOUR_PART_TIME_TICKET,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: FloatingActionButton.extended(
                heroTag: 'Text',
                label: const Text(
                  '좌석 선택후 시간을 선택해주세요.',
                  style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
            ),
            Card(
              color: AppColor.appPurple,
              margin: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 30,
                height: 60,
                child: TimerBuilder.periodic(
                  const Duration(seconds: 1),
                  builder: (context) {
                    return Text(
                      '현재시간 : ${DateFormat('yyyy년 MM월 dd일 h시 mm분 ss초 a').format(DateTime.now().add(const Duration(hours: 9)))}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(width: 500, child: Divider(color: Colors.black, thickness: 2.0)),
            const SizedBox(height: 20),
            Row(
              children: [
                FloatingActionButton.extended(
                  heroTag: 'entrance2',
                  label: Text(Api.cafeName), // <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 70),
            FloatingActionButton.extended(
              heroTag: 'Area1',
              label: const Text('좌석번호'), // <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: () {
                //server.getAllRoomStateReq(context);
                print(seatList);
              },
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'colorSelect',
                    backgroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(' : 사용가능'),
                  FloatingActionButton.small(
                    heroTag: 'colorSelect2',
                    backgroundColor: AppColor.appPurple,
                    onPressed: () {},
                  ),
                  const Text(' : 사용불가능'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: homeController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (isLogined == true &&
                        homeController.seatDatas[index].seatState.length == 10 &&
                        homeController.userTicketInfo?.isValidTicket == 'VALID') {
                      setState(() {
                        selectedSeatNumber = index + 1;
                      });
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpecificSeatPage(selectedSeatNumber),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: ref.watch(homeStateProvider.notifier).getRoomState(index)
                          ? AppColor.appPurple
                          : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${homeController.seatDatas[index].seatNumber + 1}',
                            style: TextStyle(
                              color: ref.watch(homeStateProvider.notifier).getRoomState(index)
                                  ? Colors.white
                                  : AppColor.appPurple,
                              fontSize: 35,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 130),
          ],
        ),
      ),
      Column(
        children: [
          Card(
            margin: const EdgeInsets.all(50.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            elevation: 6.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 300,
              height: 300,
              child: QrImage(
                data: homeController.qrCode,
                version: QrVersions.auto,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          const Text(
            '주의 ! QR코드를 타인에게 노출하지마세요.',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 30),
          FloatingActionButton.extended(
            heroTag: 'UserName',
            icon: const Icon(Icons.account_box),
            label: homeController.userName != ''
                ? Text(
                    '${homeController.userName}님',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                : const Text('로그인 후 사용해주세요'),
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'UserSeat',
            icon: const Icon(Icons.event_seat),
            label: homeController.seatReservationSeatNumber != 0
                ? Text(
                    '내 좌석번호 : ${homeController.seatReservationSeatNumber + 1}번',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                : const Text('사용중인 좌석이 없습니다'), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'UserTime',
            icon: const Icon(Icons.timer),
            label: homeController.seatReservationStartTime != 0
                ? Text(
                    '좌석 남은시간: ${homeController.format}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                : const Text('사용중인 좌석이 없습니다'), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: 'Pass3',
            icon: const Icon(Icons.credit_card_outlined),
            label: const Text(
              '내 이용권정보',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 16),
            ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'Pass2',
            label: Text(
              Api.cafeName,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 16),
            ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          Image.asset(
            AppAssets.logoPass,
            width: 400,
            height: 400,
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'Pass',
            icon: const Icon(Icons.timelapse_rounded),
            label: homeController.period == 0
                ? const Text('이용권이 없습니다')
                : Text(
                    '티켓남은기간: $validTime ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
        ],
      )
    ];
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: Image.asset(
          AppAssets.logo,
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCafePage())),
            },
            icon: const Icon(Icons.storefront_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () => {
              if (isLogined == true)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentPage()),
                  )
                }
              else if (isLogined == false)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginDemo()),
                  ),
                }
            },
            icon: isLogined ? const Icon(Icons.add_card) : const Icon(Icons.login),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.appPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor:
            isLogined ? Colors.white.withOpacity(.60) : Colors.white.withOpacity(.10),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: homeController.selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          if (isLogined == true) {
            ref.read(homeStateProvider.notifier).setSelectedIndex = index;
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: '좌석',
            icon: Icon(Icons.event_seat),
          ),
          BottomNavigationBarItem(
            label: 'QR코드',
            icon: Icon(Icons.qr_code_2),
          ),
          BottomNavigationBarItem(
            label: '내 이용권',
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(homeController.selectedIndex),
      ),
    );
  }
}
