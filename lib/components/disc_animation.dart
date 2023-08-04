import 'dart:math' as math;

import 'package:flutter/material.dart';

class FooPage extends StatefulWidget {
  const FooPage({super.key});

  @override
  _FooPageState createState() => _FooPageState();
}

class _FooPageState extends State<FooPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 20))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          );
        },
        child: Image.asset(
          "assets/icons/disc.png",
          // scale: 2,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
