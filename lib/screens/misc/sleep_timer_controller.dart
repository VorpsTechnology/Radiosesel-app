import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../manager/player_manager.dart';
import '../../services/service_locator.dart';

class SleepTimerController extends GetxController {
  Timer? timer;
  Timer? _timer;
  RxBool isSleepTimerRunning = false.obs;
  Duration duration = Duration.zero;

  final pageManager = getIt<PlayerManager>();
  void startTimer(int sleepTimerDuration, BuildContext ctx, [TimeOfDay? time]) {
    isSleepTimerRunning.value = true;
    duration = Duration(minutes: sleepTimerDuration);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    Timer(Duration(minutes: sleepTimerDuration), () {
      pageManager.pause();
      isSleepTimerRunning.value = false;
      timer?.cancel();
      _timer?.cancel();
      update();
    });
    Navigator.maybePop(ctx);
  }

  void addTime() {
    const int addSeconds = -1;

    final int seconds = duration.inSeconds - addSeconds;

    duration = Duration(seconds: duration.inSeconds - 1);

    update();
  }

  void cancelTimer(BuildContext ctx) {
    isSleepTimerRunning.value = false;
    timer?.cancel();
    _timer?.cancel();
    update();
    Navigator.maybePop(ctx);
  }
}
