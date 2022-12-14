import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common_enum/product/product_enum.dart';
import '../../style/app_color.dart';
import 'in_app_payment/in_app_payment.dart';

class PaymentDetailTimePage extends StatelessWidget {
  const PaymentDetailTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appPurple,
          title: Text('자유석 시간권', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 20),),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        body: ListView(
            children:[
              ListTile(
                selectedColor: Colors.grey,
                title: Text('*  해당 시간동안 사용가능한 시간권입니다.',style :TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 14),),
                onTap: () {
                },
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time_outlined, size: 40,color: Colors.black,),
                title: Text('1시간'),
                subtitle: const Text('1,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.ONE_HOUR_PART_TIME_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time_outlined, size: 40,color: Colors.black,),
                title: Text('4시간'),
                subtitle: const Text('7,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.FOUR_HOUR_PART_TIME_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time_outlined, size: 40,color: Colors.black,),
                title: Text('10시간'),
                subtitle: const Text('10,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.TEN_HOUR_PART_TIME_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time_outlined, size: 40,color: Colors.black,),
                title: Text('50시간'),
                subtitle: const Text('35,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.FIFTY_HOUR_PART_TIME_TICKET,)));
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time_outlined, size: 40,color: Colors.black,),
                title: Text('100시간'),
                subtitle: const Text('50,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.HUNDRED_HOUR_PART_TIME_TICKET,)));
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
