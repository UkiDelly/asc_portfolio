import 'package:asc_portfolio/common/drawer.dart';
import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/pages/admin/admin_sales_screen.dart';
import 'package:asc_portfolio/pages/admin/admin_search_user_screen.dart';
import 'package:asc_portfolio/pages/admin/admin_seat_manage_screen.dart';
import 'package:asc_portfolio/provider/admin_state/admin_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../provider/login_state/login_state.dart';
import '../../server/api/api.dart';
import '../../style/app_color.dart';

class AdminMainPage extends ConsumerStatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends ConsumerState<AdminMainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = ref.watch(adminStateNotifierProvider);
    final FlutterSecureStorage storage = ref.watch(secureStorageProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashColor: Colors.transparent,
          style: IconButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          onPressed: (() => scaffoldKey.currentState?.openDrawer()),
          icon: const Icon(
            Icons.menu,
            size: 35,
          ),
        ),
        backgroundColor: AppColor.appPurple,
        title: Text('${Api.cafeName} 관리자 페이지'),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              setState(
                () {
                  storage.deleteAll();
                  //storage.write(key: 'accessToken', value: null);
                  ref.invalidate(loginStateProvider);
                },
              );
              context.go('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.appPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: adminController.selectedIndex,
        //현재 선택된 Index
        onTap: (int index) {
          // setState(() {
          //   adminController = adminController.copyWith(selectedIndex = index);
          // });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linearToEaseOut,
          );

          // adminControllerNotifier.setSelectedIndex(index);
          print(index);
          setState(() {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '판매량',
            icon: Icon(Icons.attach_money_sharp),
          ),
          BottomNavigationBarItem(
            label: '사용자 검색, 환불',
            icon: Icon(Icons.accessibility_sharp),
          ),
          BottomNavigationBarItem(
            label: '좌석강제종료',
            icon: Icon(Icons.airline_seat_recline_normal_sharp),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: const [AdminSalesScreen(), AdminSearchUserScreen(), AdminSeatManageScreen()],
      ),
    );
  }

//   Widget _buildPopupDialogChange(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: AppColor.appPurple,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: const [
//           Text(
//             '강제 종료 되었습니다.',
//             style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
//           ),
//         ],
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 '종료시킨 좌석번호 : $selectedSeatNumber번',
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () async {
//             Navigator.pop(context);
//           },
//           child: const Text(
//             'OK',
//             style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
}
