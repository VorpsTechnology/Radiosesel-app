// import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class RandomCover extends StatefulWidget {
  const RandomCover({super.key});

  @override
  State<RandomCover> createState() => _RandomCoverState();
}

class _RandomCoverState extends State<RandomCover> {
  String currentImg = "assets/images/bg1.jpg";
  final Random _random = Random();
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      int _current = _random.nextInt(3);
      setState(() {
        currentImg = randomCovers[_current];
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2.2,
      width: MediaQuery.of(context).size.width*.8,
      child: Image.asset(
        currentImg,
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class GradientBG extends StatelessWidget {
  const GradientBG({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.1,
          0.4,
          0.6,
          0.9,
        ],
        colors: [
          Colors.cyan,
          Colors.cyanAccent,
          Colors.yellow,
          Colors.orange,
        ],
        // colors: [
        //   Color.fromARGB(255, 1, 207, 235),
        //   Colors.orange,
        // ],
      )),
      child: child,
    );
  }
}
