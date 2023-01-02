import 'package:asc_portfolio/constant/enum/help-center/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpPaymentScreen extends StatelessWidget {
  const HelpPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제관련'),
        actions: [
          // create a IconButton with edit icon
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () =>
                context.go('/help_center/support/${ProblemCategory.payment.enumToString}'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //TODO: 결제 관련 FAQ 보여주기
          ],
        ),
      ),
    );
  }
}
