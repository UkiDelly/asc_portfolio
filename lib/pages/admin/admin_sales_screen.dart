import 'package:asc_portfolio/constant/sales/sale_enum.dart';
import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/provider/admin_sales/admin_sales_state_notifier.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/admin_state/admin_state_notifier.dart';

class AdminSalesScreen extends ConsumerWidget {
  const AdminSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AdminController adminController = ref.watch(adminStateProvider);
    final AdminStateNotifier adminControllerNotifier = ref.watch(adminStateProvider.notifier)
      ..setSeatList(adminController)
      ..setTotalSales(adminController);

    final salesState = ref.watch(salesProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Card(
                color: AppColor.appPurple,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          '금일 매출액',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${salesState.todaySales} 원',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed:
                        salesState is SalesState && salesState.salesRange == SalesRange.oneDay
                            ? null
                            : () => ref.read(salesProvider.notifier).getSales(SalesRange.oneDay),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      '1일 매출',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        salesState is SalesState && salesState.salesRange == SalesRange.oneWeek
                            ? null
                            : () => ref.read(salesProvider.notifier).getSales(SalesRange.oneWeek),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      '7일 매출',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        salesState is SalesState && salesState.salesRange == SalesRange.oneMonth
                            ? null
                            : () => ref.read(salesProvider.notifier).getSales(SalesRange.oneMonth),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      '30일 매출',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: const Text(
                  '개별날짜선택',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.appPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {
                  adminControllerNotifier.select4();
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2023),
                  ).then((date) {
                    ref.read(salesProvider.notifier).getSalesOfDate(date!);
                  });
                },
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
                        '${(salesState).totalSales} 원',
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
                  itemCount: (salesState).productList.length,
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
                        title: Text(salesState.productList[idx].productNameTypeString),
                        subtitle: Text('금액: ${salesState.productList[idx].productPrice},'
                            ' 일시 : ${salesState.productList[idx].createDate.replaceAll('T', ' ').substring(0, 19)},'
                            ' 제품번호: ${salesState.productList[idx].productLabel},'
                            ' 상태: ${salesState.productList[idx].productState}'),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
