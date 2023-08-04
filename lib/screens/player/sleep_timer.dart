import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_colors.dart';

import '../../manager/player_manager.dart';
import '../../services/service_locator.dart';

void startSleepTimer(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: CommonColor.secondaryColor,
        icon: Row(
          children: const [Text('Sleep Timer'), Icon(Icons.timer)],
        ),
        title: const Text("Select sleep duration"),
        content: Wrap(
          spacing: 5,
          children: [
            FilledButton(
                onPressed: () {
                  sleepTimerDuration = 5;
                },
                child: const Text("5")),
            FilledButton(
                onPressed: () {
                  sleepTimerDuration = 15;
                },
                child: const Text("15")),
            FilledButton(
                onPressed: () {
                  sleepTimerDuration = 30;
                },
                child: const Text("30")),
            FilledButton(
                onPressed: () {
                  sleepTimerDuration = 60;
                },
                child: const Text("60")),
            FilledButton(
                onPressed: () {
                  sleepTimerDuration = 120;
                },
                child: const Text("120")),
          ],
        ),
        actions: <Widget>[
          FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                startTimer();
              },
              child: const Text('Start'))
        ],
      );
    },
  );
}

int sleepTimerDuration = 0;
final pageManager = getIt<PlayerManager>();
void startTimer() {
  Timer(Duration(minutes: sleepTimerDuration), () {
    // Pause the music player here
    // Add the logic to pause the music player in your app
    pageManager.pause();
  });
}
