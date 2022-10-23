import 'dart:async';

import 'package:flutter/material.dart';

class DelayAnimationWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayAnimationWidget({
    Key? key,
    required this.child,
    required this.delay,
  }) : super(key: key);

  @override
  State<DelayAnimationWidget> createState() => _DelayAnimationWidgetState();
}

class _DelayAnimationWidgetState extends State<DelayAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(_curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
