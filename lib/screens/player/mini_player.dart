import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/misc/base_controller.dart';
import 'package:music_streaming_mobile/screens/player/player_buttons.dart';
import 'package:music_streaming_mobile/theme/extention.dart';

import '../../manager/player_manager.dart';
import '../../model/radio_model.dart';
import '../../services/service_locator.dart';

class SmallSizePlayerController extends StatefulWidget {
  const SmallSizePlayerController({
    Key? key,
  }) : super(key: key);

  @override
  SmallSizePlayerControllerState createState() =>
      SmallSizePlayerControllerState();
}

class SmallSizePlayerControllerState extends State<SmallSizePlayerController> {
  final pageManager = getIt<PlayerManager>();
  final BaseController baseController = Get.find();

  double coverImageSize = 40;
  double playerHeight = 80;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: pageManager.playStateNotifier,
        builder: (_, value, __) {
          return value == false
              ? Container()
              : InkWell(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 80,
                    decoration: BoxDecoration(
                        color:
                            Theme.of(context).primaryColorDark.withOpacity(.7),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                ValueListenableBuilder<RadioModel?>(
                                  valueListenable:
                                      pageManager.currentRadioChangeNotifier,
                                  builder: (_, modal, __) {
                                    return GetBuilder<BaseController>(
                                        builder: (context) {
                                      return Image.network(
                                        baseController.currentBG.value,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ).round(5);
                                    });
                                  },
                                ).vP16,
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            ValueListenableBuilder<RadioModel?>(
                              valueListenable:
                                  pageManager.currentRadioChangeNotifier,
                              builder: (_, modal, __) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ValueListenableBuilder<String>(
                                        valueListenable:
                                            pageManager.currentSong,
                                        builder: (_, modal, __) {
                                          return SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Text(
                                              pageManager.currentSong.value,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                              maxLines: 1,
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Text(modal?.artistName ?? '',
                                    //     style: TextStyles
                                    //         .bodySm.subTitleColor),
                                  ],
                                );
                              },
                            ).vP8,
                            const Spacer(),
                            const PlayButton(size: 40),
                          ],
                        ).hp(16),
                        // fullScreen == true ? const Spacer() : Container(),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
        });
  }
}
