import 'package:flutter/material.dart';
import 'package:learn_widgets_design_in_flutter/widgets/button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/chip_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/grid_item.dart';
import 'package:learn_widgets_design_in_flutter/widgets/list_item.dart';
import 'package:learn_widgets_design_in_flutter/widgets/horizontal_stack.dart';
import 'package:learn_widgets_design_in_flutter/widgets/icon_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/selectable_button_list.dart';
import 'package:learn_widgets_design_in_flutter/widgets/vertical_ticker.dart';
import '../widgets/app_badge.dart';
import '../widgets/rating_stars.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Widgets — Lesson 1')),
      body: Padding(
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

              //onTap: // optional - if not provided, item is not clickable and you can make individual widgets clickable
              //  () => {print("Item tapped")},
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
                HorizontalStack(
                  children: [
                    Text("Me"),
                    Spacer(),
                    VerticalTicker(
                      alignment:
                          Alignment
                              .centerRight, //centerLeft or centerRight depending position of HorizontalStack
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
              imageSize: 100,

              //onTap: // optional - if not provided, item is not clickable and you can make individual widgets clickable
              //  () => {print("Item tapped")},
              bottomItems: [
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
                HorizontalStack(
                  children: [
                    Text("Me"),
                    Spacer(),
                    VerticalTicker(
                      alignment:
                          Alignment
                              .centerRight, //centerLeft or centerRight depending position of HorizontalStack
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
      ),
    );
  }
}
