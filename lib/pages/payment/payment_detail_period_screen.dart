import 'package:flutter/material.dart';

import '../../common/base_scaffold.dart';
import '../../constant/enum/product/product_enum.dart';
import 'in_app_payment/in_app_payment.dart';

class PaymentDetailPeriodPage extends StatelessWidget {
  const PaymentDetailPeriodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColor.appPurple,
      //   title: const Text(
      //     '자유석 기간권',
      //     style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
      //   ),
      //   shadowColor: Colors.white,
      //   elevation: 1,
      // ),

      appBarTitle: const Text(
        '자유석 기간권',
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
      ),
      appBarElevation: 1,
      body: ListView(
        children: [
          ListTile(
            selectedColor: Colors.grey,
            title: const Text(
              '*  해당 기간동안 자유롭게 이용가능한 기간권입니다.',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.bookmark_outline_sharp,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('7일'),
            subtitle: const Text('15,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.weekFixedTermTicket,
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
              Icons.bookmark_outline_sharp,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('14일'),
            subtitle: const Text('30,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const InAppPaymentSecond(product: Product.twoWeekFixedTermTicket),
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
              Icons.bookmark_outline_sharp,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('21일'),
            subtitle: const Text('40,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const InAppPaymentSecond(product: Product.threeWeekFixedTermTicket),
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
              Icons.bookmark_outline_sharp,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('28일'),
            subtitle: const Text('50,000원'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppPaymentSecond(
                    product: Product.fourWeekedFixedTermTicket,
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
