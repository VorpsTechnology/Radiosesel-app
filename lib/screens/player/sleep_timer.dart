
import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';


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
        child: Column(children: [
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
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => SheetEntry(
              onTap: () =>
                  startTimer(sleepTimerCounts.keys.toList()[index], context),
              title: sleepTimerCounts.values.toList()[index],
            ),
            itemCount: sleepTimerCounts.keys.length,
          )),
          SheetEntry(
            onTap: () => startTimer(sleepTimerCounts.keys.toList()[1], context),
            title: "Custom time",
          ),
          SheetEntry(
              onTap: () =>
                  startTimer(sleepTimerCounts.keys.toList()[1], context),
              title: "Cancel"),
          const Spacer() 
        ]),
      ),
    );

// int  = 0;
final pageManager = getIt<PlayerManager>();
void startTimer(int sleepTimerDuration, BuildContext ctx) {
  Timer(Duration(minutes: sleepTimerDuration), () {
    // Pause the music player here
    // Add the logic to pause the music player in your app
    pageManager.pause();
  });
  Navigator.maybePop(ctx);
}

class SheetEntry extends StatelessWidget {
  const SheetEntry({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}
