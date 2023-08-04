import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:music_streaming_mobile/model/news_model.dart';
import 'package:xml2json/xml2json.dart';
import 'package:html/parser.dart';

class NewsManager {
  final myTransformer = Xml2Json();
  Future<List<Item>> getNews(String? category) async {
    List<Item> news = [];
    log("gettting news");
    var url = Uri.tryParse(
      "http://www.seychellesnewsagency.com/rss/$category",
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
    };
    try {
      var response = await http.get(url!, headers: header);
      myTransformer.parse(response.body);
      var json = myTransformer.toGData();
      final data = newsModelFromJson(json);
      log(json);
      debugPrint(data.rss.channel.item.length.toString());
      news = data.rss.channel.item;
    } catch (e) {
      log(e.toString());
    }
    return news;
  }

  String? parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString =
        parse(document.body?.text).documentElement?.text;

    return parsedString;
  }

  final newsCategories = [
    "Business",
    "National",
    "Environment",
    "Entertainment",
    "Best in Seychelles"
  ];
  final newsCategoriesApi = [
    "/1/Business",
    "/2/National",
    "/4/Environment",
    "/5/Entertainment",
    "Best in Seychelles"
  ];
}
