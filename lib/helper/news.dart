import 'dart:convert';

import 'package:flutter_news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2d742239c3cc4374bb157e4f5104ea0f";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            description: element['description'],
            content: element['content'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            author: element['author'],
          );

          news.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<Article> categorynews = [];

  Future<void> categorygetNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=us&category=business&apiKey=2d742239c3cc4374bb157e4f5104ea0f";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            description: element['description'],
            content: element['content'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            author: element['author'],
          );

          categorynews.add(article);
        }
      });
    }
  }
}
