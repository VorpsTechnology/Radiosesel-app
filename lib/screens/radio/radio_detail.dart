import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/components/disc_animation.dart';
import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/radio/radio_detail_controller.dart';

class RadioDetail extends StatefulWidget {
  final RadioModel radio;
  // final List<RadioModel> allRadios;

  const RadioDetail({
    Key? key,
    required this.radio,
  }) : super(key: key);

  @override
  RadioDetailState createState() => RadioDetailState();
}

class RadioDetailState extends State<RadioDetail> {
  final RadioDetailController radioDetailController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    // radioDetailController.setCurrentRadio(widget.radio);
    // radioDetailController.getSimilarRadios();
    // radioDetailController.checkIfAlreadyLiked();

    // InterstitialAds().loadInterstitialAd();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   backgroundColor: Theme.of(context).backgroundColor,
        //   body:
        Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              // DashboardNavigationBar().vP25,
              radioImage(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 70,
                  ),
                ],
              ).hP16,
            ],
          ),
        ),
      ],
    );
  }

  Widget radioImage() {
    return Stack(
      children: [
        const RandomCover(),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.black.withAlpha(85),
        ),
        const Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: FooPage(),
        ),
        // Positioned(
        //     // top: 0,
        //     bottom: 100,
        //     left: 0,
        //     right: 0,
        //     child: Container(
        //       // color: Colors.yellow,
        //       // height: 40,
        //       width: double.infinity,
        //       decoration: const BoxDecoration(boxShadow: [
        //         BoxShadow(
        //           color: Colors.black45,
        //           blurRadius: 5.0,
        //           spreadRadius: 2,
        //           offset: Offset(
        //             1,
        //             2,
        //           ),
        //         ),
        //       ], borderRadius: BorderRadius.all(Radius.circular(15))),
        //       child: BorderButtonType1(
        //         text: "LISTEN",
        //         onPress: () {
        //           getIt<PlayerManager>().addPlaylist(
        //             radio: widget.radio,
        //           );
        //         },
        //         backgroundColor: CommonColor.primaryColor.withOpacity(.6),
        //         textStyle: const TextStyle(
        //             color: Colors.white, fontSize: 25, letterSpacing: 11),
        //         borderColor: CommonColor.primaryColor,
        //         cornerRadius: 15,
        //       ),
        //     ).hP16),
        const Positioned(
          child: CustomNavigationBar(),
          top: 0,
          // bottom: 140,
          left: 0,
          right: 0,
        )
      ],
    ).ripple(() {
      getIt<PlayerManager>().addPlaylist(
        radio: widget.radio,
      );
    });
  }

  Widget radioBasicInfo() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Quick links",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() => ThemeIconWidget(
                    radioDetailController.isFav.value == true
                        ? ThemeIcon.favFilled
                        : ThemeIcon.fav,
                    color: radioDetailController.isFav.value == true
                        ? Colors.red
                        : Colors.white)
                .ripple(() {
              radioDetailController.favBtnTapped();
            }))
      ],
    );
  }

  Widget similarRadiosView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationString.similarRadios,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        GetBuilder<RadioDetailController>(
            init: radioDetailController,
            builder: (ctx) {
              return SizedBox(
                height: 165,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: radioDetailController.similarRadios.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return radioView(
                              radioDetailController.similarRadios[index])
                          .ripple(() {
                        Get.to(() => RadioDetail(
                              radio: radioDetailController.similarRadios[index],
                            ));
                      });
                    },
                    separatorBuilder: (BuildContext ctx, int index) {
                      return const SizedBox(
                        width: 20,
                      );
                    }),
              );
            })
      ],
    );
  }

  Widget aboutRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${LocalizationString.about} ${widget.radio.name}',
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        const SizedBox(height: 20),
        Text(
          widget.radio.about,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget radioView(RadioModel artist) {
    return Column(
      children: [
        Image.network(artist.image, fit: BoxFit.cover, height: 120, width: 120)
            .circular,
        const SizedBox(
          height: 20,
        ),
        Text(
          artist.name,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }

  Widget quickButton(String img, VoidCallback onTap, String label) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black, //New
                    blurRadius: 4.0,
                    spreadRadius: 1)
              ],
            ),
            child: Image(
              image: AssetImage(img),
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Color(0xff232323)),
          ).p8
        ],
      ),
    );
  }
}
