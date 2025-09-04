import 'package:flutter/material.dart';
import 'package:learn_widgets_design_in_flutter/widgets/button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/chip_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/grid_item.dart';
import 'package:learn_widgets_design_in_flutter/widgets/list_item.dart';
import 'package:learn_widgets_design_in_flutter/widgets/horizontal_stack.dart';
import 'package:learn_widgets_design_in_flutter/widgets/icon_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/selectable_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/two_pane_switcher.dart';
import 'package:learn_widgets_design_in_flutter/widgets/vertical_ticker.dart';
import '../widgets/app_badge.dart';
import '../widgets/rating_stars.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widgets — Lesson 1'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Learn 1'),
              Tab(text: 'Learn 2'),
              Tab(text: 'Learn 3'),
              Tab(text: 'Learn 4'),
              Tab(text: 'Learn 5'),
              Tab(text: 'Learn 6'),
              Tab(text: 'Learn 7'),
              Tab(text: 'Learn 8'),
              Tab(text: 'Learn 9'),
              Tab(text: 'Learn 10'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LearnTab1Content(),
            LearnTab2Content(),
            LearnTab3Content(),
            LearnTab4Content(),
            PlaceholderTab(tabNumber: 4),
            PlaceholderTab(tabNumber: 5),
            PlaceholderTab(tabNumber: 6),
            PlaceholderTab(tabNumber: 7),
            PlaceholderTab(tabNumber: 8),
            PlaceholderTab(tabNumber: 9),
            PlaceholderTab(tabNumber: 10),
          ],
        ),
      ),
    );
  }
}

/// Original content moved to its own widget
class LearnTab1Content extends StatelessWidget {
  const LearnTab1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            'Badges',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppBadge(label: 'NEW'),
              AppBadge(
                label: 'SALE',
                color: Color(0xFFFFE8E6),
                textColor: Color(0xFF9A1B0A),
              ),
              AppBadge(
                label: 'FEATURED',
                color: Color(0xFFEFF6FF),
                textColor: Color(0xFF1E3A8A),
              ),
              AppBadge(label: 'TOP RATED'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Button List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ButtonList(
            labels: const ['Electronics', 'Fashion', 'Groceries', 'Toys'],
            onPressed: (label) {
              print('Pressed: $label');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Icon Button List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          IconButtonList(
            items: const [
              ScrollButtonItem(icon: Icons.phone_iphone, label: 'Phones'),
              ScrollButtonItem(icon: Icons.laptop_mac, label: 'Laptops'),
              ScrollButtonItem(icon: Icons.watch, label: 'Watches'),
              ScrollButtonItem(label: 'Toys'),
            ],
            onPressed: (item) {
              print('Pressed: ${item.label}');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Chip Button List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ChipButtonList(
            labels: const ['Electronics', 'Fashion', 'Groceries', 'Toys'],
            onPressed: (label) {
              print('Pressed: $label');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Selectable Button List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          SelectableButtonList(
            labels: const ['Electronics', 'Fashion', 'Groceries', 'Toys'],
            onSelectionChanged: (labels) {
              print('Selected: $labels');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Vertical Ticker',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          VerticalTicker(
            alignment: Alignment.centerLeft,
            items: const [
              Text('Free shipping over \$30'),
              Text('2 years warranty'),
              Text('New arrival'),
            ],
            height: 20,
            animationDuration: Duration(milliseconds: 400),
            pauseDuration: Duration(seconds: 2),
          ),
          const SizedBox(height: 24),
          const Text(
            'List Item',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          ListItem(
            rightContentAxisAlignment: MainAxisAlignment.center,
            rightContentSpacing: 2,
            imageUrl: "https://via.placeholder.com/150",
            imageSize: 100,
            rightItems: [
              HorizontalStack(
                children: [
                  Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
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
              HorizontalStack(
                children: [
                  Text("Me"),
                  Spacer(),
                  VerticalTicker(
                    alignment: Alignment.centerRight,
                    items: const [
                      Text('Free shipping over \$30'),
                      Text('2 years warranty'),
                      Text('New arrival'),
                    ],
                    height: 18,
                    animationDuration: Duration(milliseconds: 400),
                    pauseDuration: Duration(seconds: 2),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'Grid Item',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          GridItem(
            bottomContentAxisAlignment: MainAxisAlignment.center,
            bottomContentSpacing: 2,
            imageUrl: "https://via.placeholder.com/150",
            imageSize: 250,
            bottomItems: [
              HorizontalStack(
                children: [
                  Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
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
              HorizontalStack(
                children: [
                  Text("Me"),
                  Spacer(),
                  VerticalTicker(
                    alignment: Alignment.centerRight,
                    items: const [
                      Text('Free shipping over \$30'),
                      Text('2 years warranty'),
                      Text('New arrival'),
                    ],
                    height: 18,
                    animationDuration: Duration(milliseconds: 400),
                    pauseDuration: Duration(seconds: 2),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Ratings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const RatingStars(rating: 4.5),
          const SizedBox(height: 8),
          const RatingStars(rating: 3),
          const SizedBox(height: 8),
          const RatingStars(rating: 0.0),
        ],
      ),
    );
  }
}

final categories = ['Consumers Electronics', 'Fashion', 'Groceries', 'Toys'];

class LearnTab2Content extends StatelessWidget {
  const LearnTab2Content({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoPaneSwitcher<String>(
      items: categories,
      leftItemBuilder: (item, isSelected) {
        return Row(
          children: [
            //Icon(Icons.category, color: isSelected ? Colors.blue : Colors.grey),
            //const SizedBox(width: 6),
            Expanded(
              child: Text(
                item,
                textScaler: TextScaler.linear(0.85),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ), // keeps it on one line
          ],
        );
      },
      rightContentBuilder: (selectedItem) {
        return Column(
          children: List.generate(10, (index) {
            return ListTile(title: Text('$selectedItem Item ${index + 1}'));
          }),
        );
      },
    );
  }
}

class LearnTab3Content extends StatelessWidget {
  const LearnTab3Content({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Number of items in the list
      padding: const EdgeInsets.all(12), // Padding around the list
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12), // Spacing between items
          child: ListItem(
            rightContentAxisAlignment: MainAxisAlignment.center,
            rightContentSpacing: 2,
            imageUrl: "https://via.placeholder.com/150",
            imageSize: 100,
            rightItems: [
              HorizontalStack(
                children: [
                  Text(
                    "Title$index",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("\$20$index"),
                ],
              ),
              HorizontalStack(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  Text("4.5 (200$index reviews)"),
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
                  Text(
                    "$index In Stock",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              HorizontalStack(
                children: [
                  Text("Me"),
                  Spacer(),
                  VerticalTicker(
                    alignment: Alignment.centerRight,
                    items: [
                      Text("Free shipping over \$30$index"),
                      Text('2 years warranty'),
                      Text('New arrival'),
                    ],
                    height: 18,
                    animationDuration: Duration(milliseconds: 400),
                    pauseDuration: Duration(seconds: 2),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LearnTab4Content extends StatelessWidget {
  const LearnTab4Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        crossAxisCount: 2, // number of columns
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GridItem(
            bottomContentAxisAlignment: MainAxisAlignment.center,
            bottomContentSpacing: 2,
            imageUrl: "https://via.placeholder.com/150",
            imageSize: 100,
            onTap:
                () => {
                  print("Item tapped"),
                }, // optional - if not provided, item is not clickable
            bottomItems: [
              HorizontalStack(
                children: [
                  Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
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
              if (index % 2 == 0 && index % 3 == 0)
                HorizontalStack(
                  children: [
                    Text("Me"),
                    Spacer(),
                    VerticalTicker(
                      alignment: Alignment.centerRight,
                      items: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Free shipping over \$30$index",
                            overflow: TextOverflow.ellipsis,
                            textScaler: TextScaler.linear(0.9),
                            //maxLines: 2,
                          ),
                        ),
                        Text('2 years warranty'),
                        Text('New arrival'),
                      ],
                      height: 18,
                      animationDuration: Duration(milliseconds: 400),
                      pauseDuration: Duration(seconds: 2),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Placeholder widget for other tabs
class PlaceholderTab extends StatelessWidget {
  final int tabNumber;
  const PlaceholderTab({required this.tabNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Content for Learn $tabNumber',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
