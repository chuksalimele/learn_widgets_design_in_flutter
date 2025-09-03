import 'package:flutter/material.dart';

/// A horizontally scrollable list of curved-corner ElevatedButtons
/// with optional icons before the text.
///
/// Example usage:
/// ```dart
/// ScrollableIconButtonList(
///   items: [
///     ScrollButtonItem(label: 'Fashion', icon: Icons.shopping_bag),
///     ScrollButtonItem(label: 'Groceries', icon: Icons.local_grocery_store),
///     ScrollButtonItem(label: 'Electronics', icon: Icons.devices),
///     ScrollButtonItem(label: 'Toys'),
///   ],
///   onPressed: (item) {
///     print('Clicked: ${item.label}');
///   },
/// )
/// ```
class IconButtonList extends StatelessWidget {
  final List<ScrollButtonItem> items;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry buttonPadding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double spacing;
  final double iconSize;
  final void Function(ScrollButtonItem)? onPressed;

  const IconButtonList({
    super.key,
    required this.items,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.borderRadius = 24,
    this.backgroundColor = const Color(0xFFF1F5F9),
    this.textColor = const Color(0xFF0F172A),
    this.spacing = 8,
    this.iconSize = 18,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (final item in items)
            Container(
              margin: EdgeInsets.only(right: spacing),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: textColor,
                  padding: buttonPadding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  elevation: 2,
                ),
                onPressed: () => onPressed?.call(item),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.icon != null) ...[
                      Icon(item.icon, size: iconSize, color: textColor),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      item.label,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A single item for [IconButtonList].
class ScrollButtonItem {
  final String label;
  final IconData? icon;

  const ScrollButtonItem({required this.label, this.icon});
}
