import 'package:asc_portfolio/pages/help_center/widgets/help_center_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/base_scaffold.dart';

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

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
            const BackGround(),
            Positioned(
              top: 100,
              child: ForeGround(labelList: labelList, iconList: iconList),
            ),
          ],
        ),
      ),
    );
  }
}
