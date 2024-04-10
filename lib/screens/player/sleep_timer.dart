import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:music_streaming_mobile/screens/misc/sleep_timer_controller.dart';

final SleepTimerController _timerController = Get.find();
Future<dynamic> startSleepTimer(BuildContext context) async =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: GetBuilder<SleepTimerController>(builder: (state) {
          String twoDigits(int n) => n.toString().padLeft(2, '0');
          final String seconds =
              twoDigits(state.duration.inSeconds.remainder(60));
          final String minutes =
              twoDigits(state.duration.inMinutes.remainder(60));

          return Column(children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timer),
                Text(' Sleep Timer',
                    style: TextStyle(
                        color: CommonColor.secondaryColor,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium!.fontSize))
              ],
            ),
            // Expanded(
            //     child: ListView.builder(
            //   itemBuilder: (context, index) =>
            for (final entry in [
              0,
              1,
              2,
            ])
              SheetEntry(
                onTap: () => _timerController.startTimer(
                    sleepTimerCounts.keys.toList()[entry], context),
                title: sleepTimerCounts.values.toList()[entry],
                color: !state.isSleepTimerRunning.value
                    ? CommonColor.black
                    : CommonColor.lightblack,
              ),
            // itemCount: sleepTimerCounts.keys.length,
            // )),
            SheetEntry(
              onTap: state.isSleepTimerRunning.value
                  ? () {}
                  : () async {
                      Future<TimeOfDay?> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ).then((value) {
                        TimeOfDay time = value as TimeOfDay;
                        final _now = DateTime.now();
                        DateTime d = DateTime(_now.year, _now.month, _now.day,
                            time.hour, time.minute);
                        final diff = d.difference(_now).inMinutes;
                        _timerController.startTimer(diff, context);
                      });
                    },
              title: "Custom time",
            ),
            SheetEntry(
              onTap: () => _timerController.cancelTimer(context),
              title: state.isSleepTimerRunning.value
                  ? "Cancel   $minutes : $seconds"
                  : "Cancel",
              color: state.isSleepTimerRunning.value
                  ? CommonColor.kGreen
                  : CommonColor.lightblack,
            ),
            // const Spacer()
          ]);
        }),
      ),
    );

// int  = 0;

class SheetEntry extends StatelessWidget {
  const SheetEntry(
      {super.key,
      required this.onTap,
      required this.title,
      this.color = Colors.black});
  final VoidCallback onTap;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Text(title,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: color)),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}
