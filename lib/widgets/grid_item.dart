import 'package:flutter/material.dart';
import 'package:learn_widgets_design_in_flutter/widgets/horizontal_stack.dart';

/// Represents the full list item with image on left and stacked rows on right
class GridItem extends StatelessWidget {
  final MainAxisAlignment bottomContentAxisAlignment;
  final double bottomContentSpacing;
  final String? imageUrl;
  final double imageSize;
  final List<HorizontalStack> bottomItems;
  final double spacing;
  final VoidCallback? onTap;

  const GridItem({
    super.key,
    this.bottomContentAxisAlignment = MainAxisAlignment.center,
    this.bottomContentSpacing = 0,
    this.imageUrl,
    this.imageSize = 80,
    required this.bottomItems,
    this.spacing = 8,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      width: imageSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Side Image
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                      )
                      : Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, color: Colors.grey),
                      ),
            ),
          ),
          SizedBox(width: spacing),

          // Bottom Side Row
          Expanded(
            child: Row(
              mainAxisAlignment: bottomContentAxisAlignment,
              spacing: bottomContentSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bottomItems,
            ),
          ),
        ],
      ),
    );

    return onTap != null ? InkWell(onTap: onTap, child: content) : content;
  }
}

/// Represents a single horizontal row inside the right column

/// Example usage:
