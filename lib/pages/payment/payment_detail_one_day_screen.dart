import 'package:flutter/material.dart';

import '../../common/base_scaffold.dart';
import '../../constant/enum/product/product_enum.dart';
import '../../style/app_color.dart';
import 'in_app_payment/in_app_payment.dart';

class PaymentDetailOneDayPage extends StatelessWidget {
  const PaymentDetailOneDayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: const Text(
          '자유석 당일권',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
        ),
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          ListTile(
            selectedColor: Colors.grey,
            title: const Text(
              '*  당일 이용 가능한 당일권 입니다.',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.looks_one,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('당일권'),
            subtitle: const Text('10,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.todayFixedTermTicket,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
