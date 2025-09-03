import 'package:flutter/material.dart';
import 'package:learn_widgets_design_in_flutter/widgets/horizontal_stack.dart';

/// Represents the full list item with image on top and stacked rows below
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
    this.bottomContentSpacing = 4,
    this.imageUrl,
    this.imageSize = 80,
    required this.bottomItems,
    this.spacing = 8,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // The vertical layout
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min, // shrink-wrap vertically
      children: [
        // Top Image
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

        // Spacing between image and bottom items
        SizedBox(height: spacing),

        // Stacked Horizontal Items
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children:
              bottomItems
                  .expand(
                    (item) => [item, SizedBox(height: bottomContentSpacing)],
                  )
                  .toList()
                ..removeLast(), // remove extra spacing after last item
        ),
      ],
    );

    // Wrap with InkWell if onTap is provided
    return onTap != null ? InkWell(onTap: onTap, child: content) : content;
  }
}
