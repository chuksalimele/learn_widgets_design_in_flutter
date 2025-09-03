import 'package:flutter/material.dart';

/// A tiny pill-shaped badge, e.g. NEW / SALE.
class AppBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const AppBadge({
    super.key,
    required this.label,
    this.color = const Color(0xFFF1F5F9), // neutral surface
    this.textColor = const Color(0xFF0F172A), // near-black
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    this.borderRadius = 999, // pill
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
