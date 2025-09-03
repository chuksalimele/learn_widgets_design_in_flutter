import 'package:flutter/material.dart';

/// Read-only star rating (0..starCount). Accepts halves (e.g., 4.5).
class RatingStars extends StatelessWidget {
  final double rating; // 0..starCount
  final int starCount;
  final double size;
  final double spacing;

  const RatingStars({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size = 18,
    this.spacing = 2,
  }) : assert(rating >= 0, 'rating must be >= 0');

  @override
  Widget build(BuildContext context) {
    final clamped = rating.clamp(0, starCount.toDouble());

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        final whole = index + 1;
        final icon =
            (clamped >= whole)
                ? Icons.star
                : (clamped > whole - 1 && clamped < whole)
                ? Icons.star_half
                : Icons.star_border;

        return Padding(
          padding: EdgeInsets.only(right: index == starCount - 1 ? 0 : spacing),
          child: Icon(icon, size: size),
        );
      }),
    );
  }
}
