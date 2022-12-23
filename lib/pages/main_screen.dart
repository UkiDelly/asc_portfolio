import 'package:animations/animations.dart';
import 'package:asc_portfolio/common/drawer.dart';
import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/pages/home/seat_screen.dart';
import 'package:asc_portfolio/pages/qr_code/qr_code.screen.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import 'my_ticket/my_ticker_screen.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  String rolyType = '';
  int selectedSeatNumber = 0;
  late FlutterSecureStorage storage;

  PageController pageController = PageController(initialPage: 0);

  // final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    storage = ref.read(secureStorageProvider);
    getRolyType();
  }

  void getRolyType() async {
    rolyType = await storage.read(key: 'roleType') ?? '';
    setState(() {
      rolyType;
    });
    if (rolyType == 'ADMIN') {
      context.go('/admin');
      // Navigator.of(context).popAndPushNamed('/AdminMainPage');
      // Navigator.popAndPushNamed(context, '/AdminMainPage');
    }
    return;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLogined = ref.watch(homeStateProvider).loginCheck;
    selectedSeatNumber = ref.watch(homeStateProvider.notifier).selectedIndex;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      appBar: AppBar(
        // backgroundColor: AppColor.appPurple,
        title: Image.asset(
          AppAssets.logo,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
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
            icon: const Icon(Icons.storefront_outlined, size: 35),
          ),
          IconButton(
            padding: const EdgeInsets.fromLTRB(8, 8, 25, 8),
            color: Colors.white,
            onPressed: () {
              if (!isLogined) context.go('/login');
              context.go('/payment');
            },
            icon: isLogined
                ? const Icon(
                    Icons.add_card,
                    size: 35,
                  )
                : const Icon(
                    Icons.login,
                    size: 35,
                  ),
          )
        ],
      ),
      floatingActionButton: OpenContainer(
        closedElevation: 10,
        closedColor: AppColor.appPurple,
        transitionDuration: const Duration(seconds: 1),
        middleColor: AppColor.appPurple,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        closedBuilder: (context, action) => const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.qr_code_2,
            size: 55,
            color: Colors.white,
          ),
        ),
        openBuilder: (context, action) => const QRCodeScreen(),
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
                    pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
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
                  onTap: () => pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
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

      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [SeatScreen(), MyTicketScreen()],
        ),
      ),

      // child: widgetOptions.elementAt(homeController.selectedIndex),
    );
  }
}
