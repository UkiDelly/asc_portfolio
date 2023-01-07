import 'package:asc_portfolio/pages/faq/widgets/faq_widgets.dart';
import 'package:flutter/material.dart';

import '../../common/base_scaffold.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: const Text('FAQ'),
      // appBarLeadingWidget: IconButton(
      //   icon: const Icon(Icons.arrow_back_ios_rounded),
      //   onPressed: () => context.push('/user'),
      // ),
      body: SafeArea(
        child: Stack(
          children: const <Widget>[
            BackGround(),
            Positioned(
              top: 100,
              child: ForeGround(),
            ),
          ],
        ),
      ),
    );
  }
}
