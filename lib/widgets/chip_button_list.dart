import 'package:flutter/material.dart';

/// A horizontally scrollable list of chip-style elevated buttons.
/// Example usage:
/// ```dart
/// ScrollableChipButtonList(
///   labels: ['Electronics', 'Fashion', 'Groceries', 'Toys'],
///   onPressed: (label) {
///     print('Tapped $label');
///   },
/// )
/// ```
class ChipButtonList extends StatelessWidget {
  final List<String> labels;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final void Function(String)? onPressed;

  const ChipButtonList({
    super.key,
    required this.labels,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.borderRadius = 24,
    this.backgroundColor = const Color(0xFFF1F5F9), // light gray
    this.textColor = const Color(0xFF0F172A),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (final label in labels)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0, // flat look like chips
                  backgroundColor: backgroundColor,
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    side: BorderSide(color: Colors.grey.shade300), // outline
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                onPressed: () => onPressed?.call(label),
                child: Text(
                  label,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
