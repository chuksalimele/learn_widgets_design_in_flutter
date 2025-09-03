import 'package:flutter/material.dart';

/// Selection modes: single or multiple
enum SelectionMode { single, multiple }

/// A horizontally scrollable list of curved-corner buttons with selection support.
class SelectableButtonList extends StatefulWidget {
  final List<String> labels;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry buttonPadding;
  final double borderRadius;
  final Color backgroundColor;
  final Color selectedColor;
  final Color textColor;
  final Color selectedTextColor;
  final SelectionMode selectionMode;
  final void Function(List<String>)? onSelectionChanged;

  const SelectableButtonList({
    super.key,
    required this.labels,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.borderRadius = 24,
    this.backgroundColor = const Color(0xFFF1F5F9),
    this.selectedColor = Colors.blue,
    this.textColor = const Color(0xFF0F172A),
    this.selectedTextColor = Colors.white,
    this.selectionMode = SelectionMode.single,
    this.onSelectionChanged,
  });

  @override
  State<SelectableButtonList> createState() => _SelectableButtonListState();
}

class _SelectableButtonListState extends State<SelectableButtonList> {
  List<String> _selected = [];

  void _onPressed(String label) {
    setState(() {
      if (widget.selectionMode == SelectionMode.single) {
        _selected = [label]; // only one selected
      } else {
        if (_selected.contains(label)) {
          _selected.remove(label);
        } else {
          _selected.add(label);
        }
      }
    });

    if (widget.onSelectionChanged != null) {
      widget.onSelectionChanged!(_selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: widget.padding,
      child: Row(
        children: [
          for (final label in widget.labels)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selected.contains(label)
                          ? widget.selectedColor
                          : widget.backgroundColor,
                  foregroundColor:
                      _selected.contains(label)
                          ? widget.selectedTextColor
                          : widget.textColor,
                  padding: widget.buttonPadding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                ),
                onPressed: () => _onPressed(label),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
