import 'package:asc_portfolio/common/drawer.dart';
import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/controller/home_controller.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/pages/home/home.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:asc_portfolio/pages/qr_code/qr_code.screen.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../server/api/api.dart';
import 'login/login_page.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  late bool isLogined;
  String? rolyType;
  late int selectedSeatNumber;

  PageController pageController = PageController(initialPage: 0);

  // final HomeController _homeController = HomeController();
  late final HomeController homeController;
  late final FlutterSecureStorage storage;

  void getRolyType() async {
    rolyType = await storage.read(key: 'roleType') ?? '';
    setState(() {
      rolyType;
    });
    if (rolyType == 'ADMIN') {
      Navigator.of(context).popAndPushNamed('/AdminMainPage');
      // Navigator.popAndPushNamed(context, '/AdminMainPage');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    storage = ref.watch(secureStorageProvider);
    homeController = ref.watch(homeStateProvider);
    isLogined = ref.watch(homeStateProvider.notifier).isLogin;
    selectedSeatNumber = ref.watch(homeStateProvider.notifier).selectedIndex;
    getRolyType();
  }

  @override
  Widget build(BuildContext context) {
    List seatList = [];

    print('DateTime=${DateTime.now()}');
    //.replaceAll(' ', '').replaceAll('-', '').replaceAll(':', '').replaceAll('.', '')
    String validTime = DateFormat('yyyy-MM-dd h시 mm분까지')
        .format(DateTime.now().add(Duration(hours: 9, minutes: homeController.period)));
    for (int i = 0; i < homeController.seatDatas.length; i++) {
      seatList.add(homeController.seatDatas[i].toJson());
    }

    List widgetOptions = [
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
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      appBar: AppBar(
        // backgroundColor: AppColor.appPurple,
        title: Image.asset(
          AppAssets.logo,
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0,
        toolbarHeight: 75,
        leading: IconButton(
          splashColor: Colors.transparent,
          style: IconButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          onPressed: (() => _scaffoldKey.currentState!.openDrawer()),
          icon: const Icon(
            Icons.menu,
            size: 35,
          ),
        ),
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
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => pageController.jumpToPage(1),
        child: const SizedBox(
          width: 70,
          child: Icon(
            Icons.qr_code_2,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColor.appPurple,
        notchMargin: 10,
        child: Container(
          height: 75,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_seat,
                        size: 30,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '좌석',
                          style: Theme.of(context).primaryTextTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              SizedBox(
                width: 70,
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '내 이용권',
                          style: Theme.of(context).primaryTextTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: AppColor.appPurple,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor:
      //       isLogined ? Colors.white.withOpacity(.60) : Colors.white.withOpacity(.10),
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   currentIndex: currentPage, //현재 선택된 Index
      //   onTap: (int index) {
      //     if (isLogined == true) {
      //       // ref.read(homeStateProvider.notifier).setSelectedIndex = index;
      //       setState(() {
      //         currentPage = index;
      //         pageController.jumpToPage(index);
      //       });
      //     }
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: '좌석',
      //       icon: Icon(Icons.event_seat),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'QR코드',
      //       icon: Icon(Icons.qr_code_2),
      //     ),
      //     BottomNavigationBarItem(
      //       label: '내 이용권',
      //       icon: Icon(Icons.account_circle_rounded),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [HomeScreen(), QRCodeScreen()],
        ),
      ),

      // child: widgetOptions.elementAt(homeController.selectedIndex),
    );
  }
}
