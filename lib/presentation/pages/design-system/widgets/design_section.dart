import 'package:flutter/material.dart';

class DesignSection extends StatelessWidget {
  const DesignSection({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.inverseSurface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.onInverseSurface,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}
