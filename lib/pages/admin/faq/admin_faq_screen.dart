import 'package:asc_portfolio/common/base_scaffold.dart';
import 'package:asc_portfolio/constant/enum/faq/category_enum.dart';
import 'package:asc_portfolio/model/faq_model.dart';
import 'package:flutter/material.dart';

class _FAQPanel {
  bool isExpanded = false;
  String headerText;
  String bodyText;

  _FAQPanel._({
    required this.headerText,
    required this.bodyText,
  });

  factory _FAQPanel.fromFAQModel({
    required FAQModel faqModel,
  }) =>
      _FAQPanel._(
        headerText: faqModel.question,
        bodyText: faqModel.answer,
      );

  @override
  String toString() =>
      '_FAQPanel(isExpanded: $isExpanded, headerText: $headerText, bodyText: $bodyText)';
}

class AdminFAQManageScreen extends StatefulWidget {
  final ProblemCategory category;
  const AdminFAQManageScreen({super.key, required this.category});

  @override
  State<AdminFAQManageScreen> createState() => _AdminFAQManageScreenState();
}

class _AdminFAQManageScreenState extends State<AdminFAQManageScreen> {
  FAQModel faqModel = const FAQModel(
    question: '질문',
    answer: '답변',
  );

  late _FAQPanel faqPanel = _FAQPanel.fromFAQModel(
    faqModel: faqModel,
  );
  @override
  Widget build(BuildContext context) {
    print(faqPanel);
    print(widget.category);

    return BaseScaffold(
      // appBar: AppBar(
      //   title: const Text('FAQ 관리'),
      // ),
      appBarTitle: const Text('FAQ 관리'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            faqPanel.isExpanded = !faqPanel.isExpanded;
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: const [
          // Expanded(
          //   child: ExpansionPanelList(
          //       // children: List.generate(0 , (index) => null),
          //       ),
          // )
        ],
      ),
    );
  }
}
