import 'dart:async';

import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/pages/admin/admin_searching_screen.dart';
import 'package:asc_portfolio/provider/admin_state/admin_state_notifier.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

import '../../server/api/api.dart';
import '../../style/app_color.dart';
import '../main_screen.dart';

class AdminMainPage extends ConsumerStatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends ConsumerState<AdminMainPage> {
  final PageController pageController = PageController(initialPage: 0);
  final _loginIdController = TextEditingController();

  int selectedSeatNumber = 0;

  String dailySales = DateTime.now().subtract(const Duration(days: 1)).toString();
  String weeklySales = DateTime.now().subtract(const Duration(days: 7)).toString();
  String monthSales = DateTime.now().subtract(const Duration(days: 30)).toString();

  //2022-12-04 06:01:14.266
  //2022-11-03 01:01:32.526

  bool isNotCompleteLoading = true;

  Future<void> startTimer(AdminStateNotifier adminStateNotifier) async {
    Timer.periodic(
      const Duration(milliseconds: 50),
      (Timer timer) => setState(
        () {
          if (adminStateNotifier.progress == 0.05) {
            setState(() {
              isNotCompleteLoading = false;
            });
            timer.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminMainPage()),
            ).then((value) {
              setState(() {
                didChangeDependencies();
              });
            });
          } else {
            adminStateNotifier.progress += 0.025;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _loginIdController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = ref.watch(adminStateProvider);
    final AdminStateNotifier adminControllerNotifier = ref.watch(adminStateProvider.notifier)
      ..fetchApi(dailySales)
      ..fechOnlyOneDay(dailySales);
    final FlutterSecureStorage storage = ref.watch(secureStorageProvider);

    List<Widget> widgetOption = [
      ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: Card(
                  color: AppColor.appPurple,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '금일 매출액',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(Icons.add_chart, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Text(
                        '${adminControllerNotifier.totalSales} 원',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    heroTag: 'select1',
                    label: const Text(
                      '1일 매출',
                      style:
                          TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                    ), // <-- Text
                    backgroundColor:
                        adminController.oneHasPressed ? AppColor.appPurple : Colors.grey,
                    onPressed: () async {
                      // _fetchApi(dailySales);
                      // adminControllerNotifier.fetchApi(dailySales);
                      // adminController.oneHasPressed = true;
                      // adminController.weekHasPressed = false;
                      // adminController.monthHasPressed = false;
                      // adminController.selectHasPressed = false;
                      // AdminMainPage._selectedDate =
                      // "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -24)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

                      adminControllerNotifier.dailySales(dailySales);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton.extended(
                    heroTag: 'select2',
                    label: const Text(
                      '7일 매출',
                      style:
                          TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                    ), // <-- Text
                    backgroundColor:
                        adminController.weekHasPressed ? AppColor.appPurple : Colors.grey,
                    onPressed: () async {
                      // setState(() {
                      //   _fetchApi(weeklySales);
                      //   adminController.weekHasPressed = true;
                      //   adminController.oneHasPressed = false;
                      //   adminController.monthHasPressed = false;
                      //   adminController.selectHasPressed = false;
                      //   AdminMainPage._selectedDate =
                      //       "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -168)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
                      // });

                      adminControllerNotifier.weeklySales(weeklySales);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton.extended(
                    heroTag: 'select3',
                    label: const Text(
                      '30일 매출',
                      style:
                          TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                    ), // <-- Text
                    backgroundColor:
                        adminController.monthHasPressed ? AppColor.appPurple : Colors.grey,
                    onPressed: () async {
                      // setState(() {
                      //   _fetchApi(monthSales);
                      //   adminController.monthHasPressed = true;
                      //   adminController.oneHasPressed = false;
                      //   adminController.weekHasPressed = false;
                      //   adminController.selectHasPressed = false;
                      //   AdminMainPage._selectedDate =
                      //       "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -720)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
                      // });
                      adminControllerNotifier.monthSales(monthSales);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                heroTag: 'select4',
                backgroundColor:
                    adminController.selectHasPressed ? AppColor.appPurple : Colors.grey,
                onPressed: () {
                  // setState(() {
                  //   adminController.selectHasPressed = true;
                  //   adminController.monthHasPressed = false;
                  //   adminController.oneHasPressed = false;
                  //   adminController.weekHasPressed = false;
                  // });
                  adminControllerNotifier.select4();
                  showDatePicker(
                    initialDatePickerMode: DatePickerMode.day,
                    context: context,
                    currentDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2023),
                    initialDate: DateTime.now(),
                  ).then((date) {
                    print('date:$date');
                    adminControllerNotifier.selectedDate =
                        "${DateFormat('yyyy-MM-dd').format(date!.add(const Duration(hours: 9)))}~${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

                    adminControllerNotifier.fetchApi(date.toString());
                    print(date.toString());
                  });

                  // Future future = showDatePicker(
                  //   initialDatePickerMode: DatePickerMode.day,
                  //   context: context,
                  //   currentDate: DateTime.now(),
                  //   firstDate: DateTime(2020),
                  //   lastDate: DateTime(2023),
                  //   initialDate: DateTime.now(),
                  // );
                  // future.then(
                  //   (date) => {
                  //     setState(() {
                  //       print('date:$date');
                  //       AdminMainPage._selectedDate =
                  //           "${DateFormat('yyyy-MM-dd').format(date.add(const Duration(hours: 9)))}~${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
                  //     }),
                  //     _fetchApi(date.toString()),
                  //     print(date.toString()),
                  //   },
                  // );
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text(
                  '개별날짜선택',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                heroTag: 'select5',
                label: Text(
                  '선택한 날짜 : ${adminControllerNotifier.selectedDate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 100,
                child: Card(
                  color: AppColor.appPurple,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '매출액',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                          SizedBox(
                            width: 80,
                          ),
                        ],
                      ),
                      Text(
                        '${adminControllerNotifier.totalSales} 원',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
                tooltip: 'salelist3',
                icon: const Icon(Icons.view_list_outlined),
                label: const Text(
                  '해당 기간 결제리스트',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                height: 500,
                child: ListView.builder(
                  itemCount: adminController.productList.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return Card(
                      elevation: 5,
                      shadowColor: AppColor.appPurple,
                      surfaceTintColor: AppColor.appPurple,
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.paypal,
                          size: 40,
                          color: Colors.black,
                        ),
                        title: Text(adminController.productList[idx].productNameTypeString),
                        subtitle: Text('금액: ${adminController.productList[idx].productPrice},'
                            ' 일시 : ${adminController.productList[idx].createDate.replaceAll('T', ' ').substring(0, 19)},'
                            ' 제품번호: ${adminController.productList[idx].productLabel},'
                            ' 상태: ${adminController.productList[idx].productState}'),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            FloatingActionButton.extended(
              backgroundColor: AppColor.appPurple,
              onPressed: () {},
              tooltip: 'salelist4',
              icon: const Icon(Icons.view_list_outlined),
              label: const Text(
                '사용자 검색',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _loginIdController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '유저 로그인 ID',
                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FloatingActionButton.extended(
                heroTag: 'Login',
                label: const Text('사용자 조회'), // <-- Text
                backgroundColor: Colors.black,
                onPressed: () async {
                  print(_loginIdController.text);
                  if (_loginIdController.text != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminSearchingPage(_loginIdController.text),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: [
                FloatingActionButton.extended(
                  heroTag: 'entrance2',
                  label: const Text('좌석 강제 종료'), // <-- Text
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
                // print(seatList);
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
              itemCount: adminController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (adminController.seatDatas[index].seatState.length == 8) {
                      setState(() {
                        selectedSeatNumber = index + 1;
                      });
                      print(selectedSeatNumber);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: AppColor.appPurple,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                '해당 좌석을 강제 종료 시킵니다.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '선택한 좌석번호 : $selectedSeatNumber번',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                // _fetchAdminCancelSeat(selectedSeatNumber - 1);

                                adminControllerNotifier
                                    .fetchAdminCancelSeat(selectedSeatNumber - 1);
                                startTimer(adminControllerNotifier);
                              },
                              child: const Text(
                                '확인',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
                      color: adminControllerNotifier.getRoomState(index)
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
                            '${adminController.seatDatas[index].seatNumber + 1}',
                            style: TextStyle(
                              color: adminControllerNotifier.getRoomState(index)
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
            const SizedBox(height: 100),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.appPurple,
        title: Text('${Api.cafeName} 관리자 페이지'),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => {
              setState(
                () {
                  storage.deleteAll();
                  //storage.write(key: 'accessToken', value: null);
                  ref.read(homeStateProvider.notifier).logOut();
                },
              ),
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen())),
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
        children: widgetOption,
      ),
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '강제 종료 되었습니다.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '종료시킨 좌석번호 : $selectedSeatNumber번',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}