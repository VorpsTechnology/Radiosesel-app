import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
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
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(180),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Image(image: NetworkImage(cover)).p8,
                      Text(date).p8,
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ).p8,
                      Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text("A D   W I D G E T"),
                      ),

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
              ),
            ],
          ).vP4,
        ],
      )),
    );
  }
}
