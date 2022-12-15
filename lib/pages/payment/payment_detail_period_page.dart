import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/enum/product/product_enum.dart';
import '../../style/app_color.dart';
import '../main_screen.dart';
import 'in_app_payment/in_app_payment.dart';

class PaymentDetailPeriodPage extends StatelessWidget {
  const PaymentDetailPeriodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appPurple,
          title: Text('자유석 기간권', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 20),),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        body: ListView(
            children:[
              ListTile(
                selectedColor: Colors.grey,
                title: Text('*  해당 기간동안 자유롭게 이용가능한 기간권입니다.',style :TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 14),),
                onTap: () {
                },
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('7일'),
                subtitle: const Text('15,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.WEEK_FIXED_TERM_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('14일'),
                subtitle: const Text('30,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.TWO_WEEK_FIXED_TERM_TICKET)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('21일'),
                subtitle: const Text('40,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.THREE_WEEK_FIXED_TERM_TICKET)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('28일'),
                subtitle: const Text('50,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.FOUR_WEEK_FIXED_TERM_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
            ]
        )
    );
  }
}
