import 'package:asc_portfolio/common/base_scaffold.dart';
import 'package:asc_portfolio/constant/enum/faq/category_enum.dart';
import 'package:flutter/material.dart';

class FAQDetailScreen extends StatelessWidget {
  final ProblemCategory category;
  const FAQDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    print(category);

    return BaseScaffold(
      body: Container(),
    );
  }
}
