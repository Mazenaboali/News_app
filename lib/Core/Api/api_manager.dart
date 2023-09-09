import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Core/model/NewsResponce.dart';
import 'package:news_app/Core/model/SourcesResponce.dart';

class ApiManager {
  static const String basUrl = 'newsapi.org';
  static const String ApiKey = '3a43957014a347c4bea7b9705ab4e455';
  static Future<SourcesResponce> getSources(String CategoryId) async {
    var url = Uri.https(basUrl, '/v2/top-headlines/sources', {
      //parameters
      'apiKey': ApiKey,
      'category': CategoryId
    });
    var response = await http.get(url);
    return SourcesResponce.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponce> getNews(String sourceId) async {
    var url = Uri.https(basUrl, '/v2/everything', {
      //parameters
      'apiKey': ApiKey,
      'sources': sourceId
    });
    var response = await http.get(url);
    return NewsResponce.fromJson(jsonDecode(response.body));
  }
}
