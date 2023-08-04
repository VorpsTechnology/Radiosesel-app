import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:music_streaming_mobile/manager/news_manager.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail(
      {super.key,
      required this.title,
      required this.description,
      required this.cover,
      required this.date});
  final String title;
  final String description;
  final String cover;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const RandomCover(),
          Column(
            children: [
              CustomNavigationBar(
                child: Text(
                  'News',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall!.fontSize,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pop(),
              ).vP8,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(180),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Image(image: NetworkImage(cover)).p8,
                      Expanded(
                        child: ListView(
                          children: [
                            Text(date).p8,
                            Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ).p8,
                            Html(
                              data: description,
                              style: {
                                "p": Style(
                                    fontSize: FontSize.medium,
                                    textAlign: TextAlign.justify),
                              },
                            )
                            // Text(NewsManager().parseHtmlString(description) ??
                            // "Loading...")
                          ],
                        ).p16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).vP4,
        ],
      )),
    );
  }
}
