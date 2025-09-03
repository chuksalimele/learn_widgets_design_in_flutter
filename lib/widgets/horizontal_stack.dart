import 'package:flutter/material.dart';

class HorizontalStack extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment alignment;

  const HorizontalStack({
    super.key,
    required this.children,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final hasSpacer = children.any((c) => c is Spacer);

    // Case 1: Only one child and no Spacer → wrap in Flexible(loose)
    if (children.length == 1 && !hasSpacer) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: alignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Flexible(fit: FlexFit.loose, child: children.first)],
      );
    }

    // Case 2: Multiple children or Spacer present → just normal Row
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
