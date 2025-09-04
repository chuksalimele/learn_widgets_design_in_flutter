import 'package:flutter/material.dart';

/// TwoPaneSwitcher with fade animation and selected item highlight
class TwoPaneSwitcher<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(T item, bool isSelected) leftItemBuilder;
  final Widget Function(T selectedItem) rightContentBuilder;
  final double leftPaneWidthFraction; // 0.0 to 1.0
  final Duration fadeDuration;
  final Color selectedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color backgroundColor;

  const TwoPaneSwitcher({
    super.key,
    required this.items,
    required this.leftItemBuilder,
    required this.rightContentBuilder,
    this.leftPaneWidthFraction = 0.25,
    this.fadeDuration = const Duration(milliseconds: 250),
    this.backgroundColor = const Color.fromARGB(28, 139, 138, 138),
    this.selectedBackgroundColor = const Color.fromARGB(0, 23, 23, 23),
    this.selectedTextColor = const Color.fromARGB(255, 8, 8, 8),
    this.unselectedTextColor = const Color.fromARGB(223, 47, 46, 46),
  }) : assert(leftPaneWidthFraction > 0 && leftPaneWidthFraction < 1);

  @override
  State<TwoPaneSwitcher<T>> createState() => _TwoPaneSwitcherState<T>();
}

class _TwoPaneSwitcherState<T> extends State<TwoPaneSwitcher<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      _selectedItem = widget.items[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

    final leftWidth =
        MediaQuery.of(context).size.width * widget.leftPaneWidthFraction;

    return Row(
      children: [
        // Left Pane
        SizedBox(
          width: leftWidth,
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = item == _selectedItem;

              return InkWell(
                onTap: () {
                  setState(() => _selectedItem = item);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),

                  color:
                      isSelected
                          ? widget.selectedBackgroundColor
                          : widget.backgroundColor,
                  child: DefaultTextStyle.merge(
                    style: TextStyle(
                      color:
                          isSelected
                              ? widget.selectedTextColor
                              : widget.unselectedTextColor,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    child: widget.leftItemBuilder(item, isSelected),
                  ),
                ),
              );
            },
          ),
        ),

        // Right Pane with fade animation
        Expanded(
          child: AnimatedSwitcher(
            duration: widget.fadeDuration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: SingleChildScrollView(
              key: ValueKey<T>(_selectedItem),
              child: widget.rightContentBuilder(_selectedItem),
            ),
          ),
        ),
      ],
    );
  }
}

/// Example usage of TwoPaneSwitcher
/** 
 final categories = ['Electronics', 'Fashion', 'Groceries', 'Toys'];

TwoPaneSwitcher<String>(
  items: categories,
  leftItemBuilder: (item, isSelected) {
    return Row(
      children: [
        Icon(Icons.category,
            color: isSelected ? Colors.blue : Colors.grey),
        const SizedBox(width: 6),
        Text(item),
      ],
    );
  },
  rightContentBuilder: (selectedItem) {
    return Column(
      children: List.generate(10, (index) {
        return ListTile(
          title: Text('$selectedItem Item ${index + 1}'),
        );
      }),
    );
  },
)
* 
*/
