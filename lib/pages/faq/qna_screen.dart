import 'package:asc_portfolio/constant/enum/faq/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../common/base_scaffold.dart';

class QnAScreen extends StatefulWidget {
  final ProblemCategory category;
  const QnAScreen({super.key, required this.category});

  @override
  State<QnAScreen> createState() => _QnAScreenState();
}

class _QnAScreenState extends State<QnAScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('category=${widget.category.enumToString}');
    return BaseScaffold(
      appBarTitle: const Text('1:1 문의'),
      body: FormBuilder(
        child: Column(
          children: [
            FormBuilderTextField(
              name: '제목',
              decoration: const InputDecoration(labelText: '제목'),
              controller: titleController,
            ),
            FormBuilderTextField(
              name: '상세사항을 기입해주세요',
              maxLines: 10,
              decoration: const InputDecoration(labelText: '내용'),
              controller: contentController,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('접수하기'))
          ],
        ),
      ),
    );
  }
}
