import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  final List SUGGEST_LIST = [
    '결제관련',
    '이용관련',
    'FAQ',
    '계정탈퇴',
  ];
  final List ICON_LIST = [
    const Icon(
      Icons.paypal,
      size: 120,
    ),
    const Icon(
      Icons.report,
      size: 120,
    ),
    const Icon(
      Icons.report,
      size: 120,
    ),
    const Icon(
      Icons.account_circle,
      size: 120,
    )
  ];

  Widget backGround() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(color: AppColor.appPurple),
        ),
        Expanded(
          flex: 5,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  get grid => Expanded(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: .90,
            children: List.generate(SUGGEST_LIST.length, (index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 100, bottom: 16),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SuggestBoardDetail(),
                            //   ),
                            // );
                          },
                          icon: ICON_LIST[index],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(SUGGEST_LIST[index])
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backGround(),
        ],
      ),
    );
  }
}
