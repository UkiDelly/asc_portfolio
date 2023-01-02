import 'package:asc_portfolio/constant/enum/help-center/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpAccountScreen extends StatelessWidget {
  const HelpAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계정'),
        actions: [
          IconButton(
            onPressed: () =>
                context.go('/help_center/support/${ProblemCategory.account.enumToString}'),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      // TODO: 계정 관련 FAQ 보여주기
      body: Container(),
    );
  }
}
