import 'package:flutter/material.dart';

class StaggerdAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double start;
  final double finish;
  const StaggerdAnimation({
    super.key,
    required this.controller,
    required this.child,
    required this.start,
    required this.finish,
  });

  @override
  Widget build(BuildContext context) {
    final animation = CurvedAnimation(
      parent: controller,
      curve: Interval(start, finish),
    );
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        return Opacity(
          opacity: controller.value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - animation.value)),
            child: child,
          ),
        );
      },
    );
  }
}
