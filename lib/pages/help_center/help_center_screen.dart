import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final List labelList = [
    '결제관련',
    '이용관련',
    'FAQ',
    '계정탈퇴',
  ];
  final List iconList = [
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.appPurple,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '건의 게시판',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('건의 내용을 선택해주세요', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  Widget foreground(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: .9,
        children: List.generate(
          labelList.length,
          (index) => Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              onTap: () => print('tapped'),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconList[index],
                    Text(labelList[index]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('FAQ'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            backGround(),
            Positioned(
              top: 100,
              child: foreground(context),
            )
          ],
        ),
      ),
    );
  }
}
