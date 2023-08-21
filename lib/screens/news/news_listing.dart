import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/components/random_cover.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:music_streaming_mobile/manager/news_manager.dart';
import 'package:music_streaming_mobile/model/news_model.dart';
import 'package:music_streaming_mobile/screens/news/news_detail.dart';

class NewsListing extends StatefulWidget {
  const NewsListing({super.key});

  @override
  State<NewsListing> createState() => _NewsListingState();
}

class _NewsListingState extends State<NewsListing> {
  String category = "";
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
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ActionChip(
                          backgroundColor: CommonColor.primaryColor,
                          label: Text(
                            NewsManager().newsCategories[index],
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xff002f6c),
                          ),
                          onPressed: () {
                            setState(() {
                              category = NewsManager().newsCategoriesApi[index];
                            });
                          },
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: NewsManager().newsCategories.length),
              ).p8,
              Expanded(
                child: Container(
                  // height: 400,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(180),
                      borderRadius: BorderRadius.circular(15)),
                  child: FutureBuilder<List<Item>>(
                      future: NewsManager().getNews(category),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          final List<Item> _data = snapshot.data;
                          return ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => ListTile(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => NewsDetail(
                                                cover:
                                                    _data[index].enclosure.url,
                                                date: _data[index].pubDate.t,
                                                description: _data[index]
                                                    .description
                                                    .cdata,
                                                title: _data[index].title.t),
                                          ));
                                          //  Get.to(() => const ContactUs());
                                        },
                                        title: Text(
                                          _data[index].title.t,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        trailing: Image(
                                          image: NetworkImage(
                                            _data[index].enclosure.url,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.grey,
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                  itemCount: _data.length)
                              .vP8;
                        } else {
                          return const Center(
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator()),
                          );
                        }
                      }),
                ).vP4,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
