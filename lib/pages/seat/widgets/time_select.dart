import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title, subtitle;
  final Widget? leading;
  final VoidCallback? onTap;
  const OptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.grey,
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
