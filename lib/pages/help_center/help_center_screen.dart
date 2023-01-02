import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _Label {
  final String label;
  final String path;

  _Label(this.label, this.path);
}

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final List<_Label> labelList = [
    _Label('결제관련', 'payment'),
    _Label('이용관련', 'useage'),
    _Label('기타', 'etc'),
    _Label('계정', 'account'),
  ];
  final List<Icon> iconList = [
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
              onTap: () => context.go('/help_center/${labelList[index].path}'),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconList[index],
                    Text(labelList[index].label),
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
        // show the back button if the page can pop up
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.go('/user'),
        ),
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
