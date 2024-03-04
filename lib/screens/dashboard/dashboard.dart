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
    return RadioDetail(
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
    );
  }
}
