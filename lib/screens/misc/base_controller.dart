import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/strings.dart';

class BaseController extends GetxController {
  late Timer _timer;
  final Random _random = Random();

  RxString currentBG = randomCovers.first.obs;
  loadBG() {
    _timer = Timer.periodic(const Duration(minutes: 6), (timer) {
      int _current = _random.nextInt(randomCovers.length);
      currentBG.value = randomCovers[_current];
      update();
    });
    update();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
