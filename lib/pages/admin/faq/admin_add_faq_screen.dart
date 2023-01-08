import 'package:asc_portfolio/common/base_scaffold.dart';
import 'package:flutter/material.dart';

class AdminAddFAQScreen extends StatefulWidget {
  const AdminAddFAQScreen({super.key});

  @override
  State<AdminAddFAQScreen> createState() => _AdminAddFAQScreenState();
}

class _AdminAddFAQScreenState extends State<AdminAddFAQScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: const Text('FAQ 추가'),
      body: Column(
        children: const [
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
