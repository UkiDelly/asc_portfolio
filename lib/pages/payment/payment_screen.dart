import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/pages/payment/payment_detail_one_day_screen.dart';
import 'package:asc_portfolio/pages/payment/payment_detail_period_screen.dart';
import 'package:asc_portfolio/pages/payment/payment_detail_time_screen.dart';
import 'package:flutter/material.dart';

import '../../style/app_color.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: AppColor.appPurple,
        title: const Text(
          '이용권 선택',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
        ),
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 80,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              tileColor: Colors.black12,
              title: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '자유석',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('기간권'),
            subtitle: const Text('일정 기간내 무제한 이용 (2주, 4주)'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentDetailPeriodPage()),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              Icons.timelapse_rounded,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('시간권'),
            subtitle: const Text('유효기간내 사용, 외출시 시간차감 (50시간, 100시간)'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentDetailTimePage()),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              Icons.looks_one,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('당일권'),
            subtitle: const Text('구매 후 시간차감, 당일 이용권 소멸'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentDetailOneDayPage()),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
