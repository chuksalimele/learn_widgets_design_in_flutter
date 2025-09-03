import 'package:flutter/material.dart';
import 'package:learn_widgets_design_in_flutter/widgets/horizontal_stack.dart';

/// Represents the full list item with image on left and stacked rows on right
class ListItem extends StatelessWidget {
  final MainAxisAlignment rightContentAxisAlignment;
  final double rightContentSpacing;
  final String? imageUrl;
  final double imageSize;
  final List<HorizontalStack> rightItems;
  final double spacing;
  final VoidCallback? onTap;

  const ListItem({
    super.key,
    this.rightContentAxisAlignment = MainAxisAlignment.center,
    this.rightContentSpacing = 0,
    this.imageUrl,
    this.imageSize = 80,
    required this.rightItems,
    this.spacing = 8,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      height: imageSize,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Side Image
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

          // Right Side Column
          Expanded(
            child: Column(
              mainAxisAlignment: rightContentAxisAlignment,
              spacing: rightContentSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rightItems,
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
/*
            ListItem(
              rightContentAxisAlignment: MainAxisAlignment.center,
              rightContentSpacing: 2,
              imageUrl: "https://via.placeholder.com/150",
              imageSize: 100,
              onTap: () => {print("Item tapped")}, // optional - if not provided, item is not clickable
              rightItems: [
                HorizontalStack(
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text("\$20"),
                  ],
                ),
                HorizontalStack(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Text("4.5 (200 reviews)"),
                    Spacer(),
                    Icon(
                      Icons.trolley,
                      size: 20,
                      color: const Color.fromARGB(255, 115, 210, 72),
                    ),
                  ],
                ),
                HorizontalStack(
                  children: [
                    Text("In Stock", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
*/
