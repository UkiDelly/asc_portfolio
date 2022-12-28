import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../provider/admin_state/admin_state_notifier.dart';

class AdminSalesScreen extends ConsumerWidget {
  const AdminSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String dailySales = DateTime.now().subtract(const Duration(days: 1)).toString();
    final String weeklySales = DateTime.now().subtract(const Duration(days: 7)).toString();
    final String monthSales = DateTime.now().subtract(const Duration(days: 30)).toString();

    final AdminController adminController = ref.watch(adminStateProvider);
    final AdminStateNotifier adminControllerNotifier = ref.watch(adminStateProvider.notifier)
      ..fetchApi(dailySales)
      ..fechOnlyOneDay(dailySales)
      ..setSeatList(adminController)
      ..setTotalSales(adminController);

    return Scaffold(
      appBar: AppBar(
        title: const Text('매출 관리'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
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
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
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
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                                subtitle: Text(
                                    '금액: ${adminController.productList[idx].productPrice},'
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
