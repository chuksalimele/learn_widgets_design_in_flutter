import 'package:flutter/material.dart';

/// A horizontally scrollable list of curved-corner ElevatedButtons.
/// Example usage:
/// ```dart
/// ScrollableButtonList(
///   labels: ['Electronics', 'Fashion', 'Groceries', 'Toys'],
///   onPressed: (label) {
///     print('Clicked: $label');
///   },
/// )
/// ```
class ButtonList extends StatelessWidget {
  final List<String> labels;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry buttonPadding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final void Function(String)? onPressed;

  const ButtonList({
    super.key,
    required this.labels,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.borderRadius = 24,
    this.backgroundColor = const Color(0xFFF1F5F9), // light gray
    this.textColor = const Color(0xFF0F172A),
    this.onPressed, // optional callback
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
                  backgroundColor: backgroundColor,
                  foregroundColor: textColor,
                  padding: buttonPadding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  elevation: 2, // small shadow for effect
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
