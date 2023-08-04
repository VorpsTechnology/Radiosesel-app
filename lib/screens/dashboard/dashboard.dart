import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';
import 'package:music_streaming_mobile/screens/dashboard/dashboard_controller.dart';

class Section {
  Section({required this.heading, required this.items, required this.dataType});

  String heading;
  List<dynamic> items = [];
  DataType dataType = DataType.playlists;
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late InfiniteScrollController controller;
  final DashboardController dashboardController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    controller = InfiniteScrollController();
    dashboardController.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        
          // ClipRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //     child: Container(
          //       height: 100,
          //       decoration: const BoxDecoration(
          //         color: Color(0xfff4d444),
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             height: 60,
          //             width: 300,
          //             // child: ThemeIconWidget(
          //             //   ThemeIcon.music,
          //             //   color: Theme.of(context).iconTheme.color,
          //             //   size: 25,
          //             // ),
          //             decoration: const BoxDecoration(
          //               image: DecorationImage(
          //                   image: AssetImage("assets/images/logo.png"),
          //                   fit: BoxFit.fitWidth),
          //             ),
          //           ).circular,
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           // Text(
          //           //   AppConfig.projectName,
          //           //   style: Theme.of(context)
          //           //       .textTheme
          //           //       .titleLarge!
          //           //       .copyWith(fontWeight: FontWeight.w700,color: const Color(0xff232323)),
          //           // )
          //         ],
          //       ).setPadding(left: 16, right: 16, top: 40),
          //     ),
          //   ),
          // ),
          RadioDetail(
            radio: RadioModel(
                id: "",
                name: "Radiosesel",
                image: "assets/images/bg1.jpg",
                about: "about",
                language: "language",
                genreName: "genreName",
                genreId: "genreId",
                status: 1,
                streamUrl: "https://stream.radiosesel.com/stream#.mp3",
                isFeatured: 0,
                searchCount: 0),
          )
        ],
      ),
    );
  }

  Widget dashBoardView() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            GetBuilder<DashboardController>(
                init: dashboardController,
                builder: (context) {
                  return dashboardController.homeSliders.isNotEmpty
                      ? sliderView()
                      : Container();
                }),
            musicCollectionView(),
            const SizedBox(
              height: 100,
            )
          ]))
        ],
      ),
    );
  }

  Widget musicCollectionView() {
    return GetBuilder<DashboardController>(
        init: dashboardController,
        builder: (ctx) {
          return SizedBox(
            height: dashboardController.sections.length * 320,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dashboardController.sections.length,
              itemBuilder: (BuildContext ctx, int index) {
                return radioSection(
                    dashboardController.sections[index], context, 0);
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return const SizedBox(
                  height: 50,
                );
              },
            ),
          );
        });
  }

  Widget sliderView() {
    return dashboardController.homeSliders.isNotEmpty
        ? SizedBox(
            height: 180,
            child: InfiniteCarousel.builder(
              itemCount: dashboardController.homeSliders.length,
              itemExtent: MediaQuery.of(context).size.width * 0.8,
              center: true,
              anchor: 0.0,
              velocityFactor: 0.2,
              onIndexChanged: (index) {},
              controller: controller,
              axisDirection: Axis.horizontal,
              loop: true,
              itemBuilder: (context, itemIndex, realIndex) {
                return Image.network(
                  dashboardController.homeSliders[itemIndex].image,
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.5,
                ).round(20).p8.ripple(() {
                  dashboardController
                      .sliderTapped(dashboardController.homeSliders[itemIndex]);
                });
              },
            ),
          )
        : Container(
            height: 0,
          );
  }
}