import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:music_streaming_mobile/manager/news_manager.dart';
import 'package:music_streaming_mobile/model/news_model.dart';
import 'package:music_streaming_mobile/screens/news/news_controller.dart';
import 'package:music_streaming_mobile/screens/news/news_detail.dart';

class NewsListing extends StatefulWidget {
  const NewsListing({super.key});

  @override
  State<NewsListing> createState() => _NewsListingState();
}

class _NewsListingState extends State<NewsListing> {
  final NewsController newsController = Get.find();
  @override
  void initState() {
    super.initState();
    newsController.getNews(0);
  }

  // String category = "";
  // final NewsController newsController = NewsController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await NewsManager().getNews(category);
    });
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          const RandomCover(),
          GetBuilder<NewsController>(builder: (ctx) {
            List<Item> _data = newsController.news;

            //  final newsController =NewsController();
            return Column(
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
                ),
                SizedBox(
                        height: 40,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ActionChip(
                                  backgroundColor: (newsController
                                              .currentCategory.obs
                                              .toString() ==
                                          NewsManager().newsCategories[index])
                                      ? Colors.white
                                      : CommonColor.primaryColor,
                                  label: Text(
                                    NewsManager().newsCategories[index],
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Color(0xff002f6c),
                                  ),
                                  onPressed: () {
                                    newsController.getNews(index);
                                  },
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: NewsManager().newsCategories.length))
                    .p8,
                Expanded(
                  child: Container(
                          // height: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white.withAlpha(180),
                              borderRadius: BorderRadius.circular(15)),
                          child: newsController.isLoading == false
                              ? ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => ListTile(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsDetail(
                                                        cover: _data[index]
                                                            .enclosure
                                                            .url,
                                                        date: _data[index]
                                                            .pubDate
                                                            .t,
                                                        description:
                                                            _data[index]
                                                                .description
                                                                .cdata,
                                                        title: _data[index]
                                                            .title
                                                            .t),
                                              ));
                                              //  Get.to(() => const ContactUs());
                                            },
                                            title: Text(
                                              _data[index].title.t,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            trailing: Image(
                                              image: NetworkImage(
                                                _data[index].enclosure.url,
                                              ),
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const SizedBox(),
                                            ),
                                          ),
                                      separatorBuilder: (context, index) {
                                        if (index % 2 == 0) {
                                          return Container(
                                            height: 60,
                                            width: double.infinity,
                                            color: Colors.red,
                                            alignment: Alignment.center,
                                            child:
                                                const Text("A D   W I D G E T"),
                                          );
                                        } else {
                                          return const Divider(
                                            color: Colors.grey,
                                            indent: 15,
                                            endIndent: 15,
                                          );
                                        }
                                      },
                                      itemCount: _data.length)
                                  .vP8
                              : const Center(
                                  child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator()),
                                ))
                      .vP4,
                ),
              ],
            );
          }),
        ],
      ),
    ));
  }
}
