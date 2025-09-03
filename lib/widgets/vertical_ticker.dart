import 'dart:async';
import 'package:flutter/material.dart';

class VerticalTicker extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final Duration animationDuration;
  final Duration pauseDuration;
  final AlignmentGeometry alignment; // new, configurable

  const VerticalTicker({
    super.key,
    required this.items,
    required this.height,
    this.animationDuration = const Duration(milliseconds: 600),
    this.pauseDuration = const Duration(seconds: 2),
    this.alignment = Alignment.centerLeft, // default left
  });

  @override
  State<VerticalTicker> createState() => _VerticalTickerState();
}

class _VerticalTickerState extends State<VerticalTicker> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTicker();
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.pauseDuration + widget.animationDuration, (
      timer,
    ) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.items.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      // keep the outer container minimal so parent constraints are preserved
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
        // IMPORTANT: change the Stack alignment from center → your alignment
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            alignment: widget.alignment,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        transitionBuilder: (Widget child, Animation<double> animation) {
          final bool isIncoming = child.key == ValueKey<int>(_currentIndex);

          final Animation<Offset> offsetAnim =
              isIncoming
                  ? Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation)
                  : Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0, -1),
                  ).animate(ReverseAnimation(animation));

          // Wrap the moving widget in Align so it is pinned to the left during the motion
          return ClipRect(
            child: SlideTransition(
              position: offsetAnim,
              child: Align(alignment: widget.alignment, child: child),
            ),
          );
        },
        // the actual child; keep its key so AnimatedSwitcher knows which is incoming/outgoing
        child: SizedBox(
          key: ValueKey<int>(_currentIndex),
          height: widget.height,
          child: Align(
            alignment: widget.alignment,
            child: widget.items[_currentIndex],
          ),
        ),
      ),
    );
  }
}
