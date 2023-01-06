import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/base_scaffold.dart';

class HelpUseageScreen extends StatelessWidget {
  const HelpUseageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('이용관련'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/help_center/support/useage'),
          ),
        ],
      ),
      body: const SizedBox(),
    );
  }
}
