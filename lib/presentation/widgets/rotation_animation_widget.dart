import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RotationAnimationWidget extends StatefulWidget {
  final Widget child;
  const RotationAnimationWidget({Key? key, required this.child})
      : super(key: key);

  @override
  State<RotationAnimationWidget> createState() =>
      _RotationAnimationWidgetState();
}

class _RotationAnimationWidgetState extends State<RotationAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _rotateAanimation = Tween<double>(begin: 0.0, end: 6.0 * pi)
        .chain(CurveTween(curve: Curves.easeOutQuart))
        .animate(_controller);

    Timer(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _controller,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_rotateAanimation.value),
              child: widget.child,
            ),
          );
        });
  }
}
