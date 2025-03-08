import 'package:flutter/material.dart';

class DesignSectionRowContent extends StatelessWidget {
  const DesignSectionRowContent({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
