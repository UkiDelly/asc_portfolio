import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/enum/product/product_enum.dart';
import '../../style/app_color.dart';
import 'in_app_payment/in_app_payment.dart';

class PaymentDetailTimePage extends StatelessWidget {
  const PaymentDetailTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: const Text(
          '자유석 시간권',
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
              '*  해당 시간동안 사용가능한 시간권입니다.',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('1시간'),
            subtitle: const Text('1,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.oneHourPartTimeTicket,
                  ),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('4시간'),
            subtitle: const Text('7,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.fourHourPartTimeTicket,
                  ),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('10시간'),
            subtitle: const Text('10,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.tenHourPartTimeTicket,
                  ),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('50시간'),
            subtitle: const Text('35,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.fiftyHourPartTimeTicket,
                  ),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('100시간'),
            subtitle: const Text('50,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.hundredHourPartTimeTicket,
                  ),
                ),
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
