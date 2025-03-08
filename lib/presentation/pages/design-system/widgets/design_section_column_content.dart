import 'package:flutter/material.dart';

class DesignSectionColumnContent<T> extends StatelessWidget {
  const DesignSectionColumnContent({
    super.key,
    required this.dtos,
    required this.widgetBuilder,
  });

  final List<T> dtos;
  final Widget Function(T) widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dtos
          .map(
            (e) => Container(
              margin: const EdgeInsets.all(4),
              child: widgetBuilder(e),
            ),
          )
          .toList(),
    );
  }
}
