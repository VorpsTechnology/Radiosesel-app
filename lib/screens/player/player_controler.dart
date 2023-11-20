import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:music_streaming_mobile/screens/player/sleep_timer.dart';
import 'package:share_plus/share_plus.dart';

import '../../components/music_visualizer.dart';

class FullSizePlayerController extends StatefulWidget {
  const FullSizePlayerController({
    Key? key,
  }) : super(key: key);

  @override
  FullSizePlayerControllerState createState() =>
      FullSizePlayerControllerState();
}

String _getRandomImage() {
  final randomIndex = Random().nextInt(randomCovers.length - 1);
  return randomCovers[randomIndex];
}

final randomCovers = [
  "assets/images/bg1.jpg",
  "assets/images/bg2.jpg",
  "assets/images/bg3.jpg",
  "assets/images/bg0.jpg",
  "assets/images/cover.jpg",
];

class FullSizePlayerControllerState extends State<FullSizePlayerController> {
  final pageManager = getIt<PlayerManager>();
  double coverImageSize = 40;
  double playerHeight = 80;
  final List<Color> colors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 250, 147, 3),
    const Color.fromARGB(255, 250, 147, 3),
  ];
  String currentImage = 'assets/images/cover.jpg';
  final List<int> duration = [
    900,
    700,
    600,
    800,
    500,
    900,
    700,
    600,
    800,
    500,
    900,
    700,
    600,
    800,
    500,
  ];

  @override
  void initState() {
    super.initState();

    final newImage = _getRandomImage();
    setState(() => currentImage = newImage);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: pageManager.playStateNotifier,
        builder: (_, value, __) {
          return value == false
              ? Container()
              : Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(currentImage), fit: BoxFit.fitHeight),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white10.withAlpha(80)),
                      // borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const Spacer(),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: CommonColor.secondaryColor,
                                    )),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      color: CommonColor.secondaryColor,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize),
                                )
                              ],
                            ),
                            // const CustomNavigationBar(),
                            ValueListenableBuilder<RadioModel?>(
                              valueListenable:
                                  pageManager.currentRadioChangeNotifier,
                              builder: (_, modal, __) {
                                return Center(
                                  child: Image.asset(
                                    "assets/images/bg1.jpg",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                  ).round(5),
                                );
                              },
                            ).hp(16),

                            ValueListenableBuilder<RadioModel?>(
                              valueListenable:
                                  pageManager.currentRadioChangeNotifier,
                              builder: (_, modal, __) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(modal?.name ?? '',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: CommonColor.kWhite)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                );
                              },
                            ).vP8,
                            const Spacer(),
                            Container(
                              height: 80,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 60, 60, 60)
                                    .withOpacity(.25),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ValueListenableBuilder<ButtonState>(
                                  valueListenable:
                                      pageManager.playButtonNotifier,
                                  builder: (_, value, __) {
                                    switch (value) {
                                      case ButtonState.playing:
                                        return MusicVisualizer(
                                          barCount: 50,
                                          colors: colors,
                                          curve: Curves.linear,
                                          duration: duration,
                                        ).p8;
                                      case ButtonState.paused:
                                        return SizedBox(
                                            height: 30,
                                            child: const Divider(
                                              color: CommonColor.kWhite,
                                              thickness: 3,
                                            ).p8);
                                      default:
                                        return MusicVisualizer(
                                          barCount: 50,
                                          colors: colors,
                                          curve: Curves.linear,
                                          duration: duration,
                                        ).p8;
                                    }
                                  }),
                            ).hp(16),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //     color: Colors.white10.withAlpha(80)),
                                color: const Color.fromARGB(255, 27, 26, 26)
                                    .withOpacity(.5),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ThemeIconButton(
                                    icon: Icons.timer,
                                    onPress: () async {
                                      startSleepTimer(context);
                                    },
                                    iconColor: CommonColor.secondaryColor,
                                  ),
                                  const PlayButton(size: 60),
                                  ThemeIconButton(
                                    icon: Icons.share,
                                    onPress: () async {
                                      await Share.share(
                                          'check out my website https://www.radiosesel.com');
                                    },
                                    iconColor: CommonColor.secondaryColor,
                                  )
                                ],
                              ),
                            ),
                            // fullScreen == true ? const Spacer() : Container(),
                            // const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
