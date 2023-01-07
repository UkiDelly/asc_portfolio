import 'package:asc_portfolio/common/base_scaffold.dart';
import 'package:asc_portfolio/constant/enum/faq/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FAQDetailScreen extends StatelessWidget {
  final ProblemCategory category;
  const FAQDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    print(category);

    return BaseScaffold(
      appBarTitle: Text(category.enumToKorean),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('1:1 문의'),
        onPressed: () => context.push('/qna/${category.enumToString}'),
      ),
      body: Container(),
    );
  }
}
