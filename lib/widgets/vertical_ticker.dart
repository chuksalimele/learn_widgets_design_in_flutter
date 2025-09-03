import 'dart:async';
import 'package:flutter/material.dart';

class VerticalTicker extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final Duration animationDuration;
  final Duration pauseDuration;
  final AlignmentGeometry alignment;

  const VerticalTicker({
    super.key,
    required this.items,
    required this.height,
    this.animationDuration = const Duration(milliseconds: 600),
    this.pauseDuration = const Duration(seconds: 2),
    this.alignment = Alignment.centerLeft,
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

  /// Helper: wrap an item so it shrink-wraps horizontally,
  /// and honors the requested alignment (left/center/right).
  Widget _shrinkWrappedItem(Widget child) {
    // Row(mainAxisSize: MainAxisSize.min) makes the box size to the child.
    // Then Align places that box according to widget.alignment.
    return Align(
      alignment: widget.alignment,
      child: Row(mainAxisSize: MainAxisSize.min, children: [child]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      // AnimatedSwitcher stack alignment and transitionBuilder handle animation.
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
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

          // SlideTransition + Align + Row(min) ensures the moving widget
          // is pinned to the requested edge and has shrink-wrapped width.
          return ClipRect(
            child: SlideTransition(
              position: offsetAnim,
              child: _shrinkWrappedItem(child),
            ),
          );
        },
        child: SizedBox(
          key: ValueKey<int>(_currentIndex),
          height: widget.height,
          // The permanent (non-animating) child must also be shrink-wrapped.
          child: _shrinkWrappedItem(widget.items[_currentIndex]),
        ),
      ),
    );
  }
}
