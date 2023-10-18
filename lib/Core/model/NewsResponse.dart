import 'package:news_app/Core/model/News.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<News>? articles;

  NewsResponse({
    this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles});

  NewsResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}