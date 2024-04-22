import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../helper/common_colors.dart';

class FooPage extends StatefulWidget {
  const FooPage({super.key, this.textVisible = true});
  final bool textVisible;
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
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          children: [
            AnimatedBuilder(
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
            Align(
              alignment: Alignment.center,
              child: widget.textVisible
                  ? Text(
                      "LISTEN",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: CommonColor.kWhite,
                          letterSpacing: 11,
                          fontWeight: FontWeight.bold),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
