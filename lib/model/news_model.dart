// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    Rss rss;

    NewsModel({
        required this.rss,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        rss: Rss.fromJson(json["rss"]),
    );

    Map<String, dynamic> toJson() => {
        "rss": rss.toJson(),
    };
}

class Rss {
    String version;
    Channel channel;

    Rss({
        required this.version,
        required this.channel,
    });

    factory Rss.fromJson(Map<String, dynamic> json) => Rss(
        version: json["version"],
        channel: Channel.fromJson(json["channel"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "channel": channel.toJson(),
    };
}

class Channel {
    Copyright title;
    Copyright link;
    Copyright description;
    Copyright language;
    Copyright copyright;
    List<Item> item;

    Channel({
        required this.title,
        required this.link,
        required this.description,
        required this.language,
        required this.copyright,
        required this.item,
    });

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        title: Copyright.fromJson(json["title"]),
        link: Copyright.fromJson(json["link"]),
        description: Copyright.fromJson(json["description"]),
        language: Copyright.fromJson(json["language"]),
        copyright: Copyright.fromJson(json["copyright"]),
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "link": link.toJson(),
        "description": description.toJson(),
        "language": language.toJson(),
        "copyright": copyright.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Copyright {
    String t;

    Copyright({
        required this.t,
    });

    factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024t": t,
    };
}

class Item {
    Copyright title;
    Copyright link;
    Copyright guid;
    Copyright category;
    Copyright pubDate;
    Enclosure enclosure;
    Description description;

    Item({
        required this.title,
        required this.link,
        required this.guid,
        required this.category,
        required this.pubDate,
        required this.enclosure,
        required this.description,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: Copyright.fromJson(json["title"]),
        link: Copyright.fromJson(json["link"]),
        guid: Copyright.fromJson(json["guid"]),
        category: Copyright.fromJson(json["category"]),
        pubDate: Copyright.fromJson(json["pubDate"]),
        enclosure: Enclosure.fromJson(json["enclosure"]),
        description: Description.fromJson(json["description"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "link": link.toJson(),
        "guid": guid.toJson(),
        "category": category.toJson(),
        "pubDate": pubDate.toJson(),
        "enclosure": enclosure.toJson(),
        "description": description.toJson(),
    };
}

class Description {
    String cdata;

    Description({
        required this.cdata,
    });

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        cdata: json["__cdata"],
    );

    Map<String, dynamic> toJson() => {
        "__cdata": cdata,
    };
}

class Enclosure {
    String url;
    String type;

    Enclosure({
        required this.url,
        required this.type,
    });

    factory Enclosure.fromJson(Map<String, dynamic> json) => Enclosure(
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
    };
}
