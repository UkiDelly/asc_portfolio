import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpEtcScreen extends StatelessWidget {
  const HelpEtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기타'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/help_center/support/etc'),
          ),
        ],
      ),
    );
  }
}
