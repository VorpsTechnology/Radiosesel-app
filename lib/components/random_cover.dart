import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/misc/base_controller.dart';

class RandomCover extends StatelessWidget {
  final BaseController baseController = Get.find();

  RandomCover({super.key}) {
    baseController.loadBG();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.width * .8,
      child: GetBuilder<BaseController>(builder: (ctx) {
        return Image.network(
          baseController.currentBG.value,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        );
      }),
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
