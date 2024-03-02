import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

import '../../manager/helper_manager.dart';

final pageManager = getIt<PlayerManager>();

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBG(),
          Column(
            children: [
              const CustomNavigationBar(),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * .75,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(180),
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        LocalizationString.donateToUs,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              LocalizationString.makeDonation,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              LocalizationString.donatePara,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                              textAlign: TextAlign.justify,
                            ).hP8,
                            InkWell(
                              onTap: () async {
                                await HelperServices.launchLink(
                                    "https://radiosesel.com/donation-radio/");
                              },
                              child: Text(
                                "Click here for donation...",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .fontSize),
                              ).vP8,
                            ),
                            ValueListenableBuilder<ButtonState>(
                                valueListenable: pageManager.playButtonNotifier,
                                builder: (_, value, __) {
                                  return SizedBox(
                                    height:
                                        value == ButtonState.playing ? 60 : 0,
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
