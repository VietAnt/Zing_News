import 'dart:convert';
import 'package:zingvn/secret.dart';
import 'package:zingvn/models/article.dart';
import 'package:zingvn/models/category_model.dart';
import 'package:http/http.dart' as http;

class News {
  //--Danh sach bai viet--//
  List<Articles> news = [];

  //-Ket noi api--/
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Articles articles = Articles(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          news.add(articles);
        }
      });
    }
  }
}

//--Danh muc--//
class NewsForCategorie {
  List<Articles> news = [];

  Future<void> getNewsForCatgorie(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Articles articles = Articles(
              title: element['title'],
              author: element['author'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
              articleUrl: element['url']);
          news.add(articles);
        }
      });
    }
  }
}
