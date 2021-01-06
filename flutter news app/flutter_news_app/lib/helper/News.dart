import 'dart:convert';

import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel>  news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=apikey";//baseurl
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = new ArticleModel(
            title: element['title'],
            authorName: element['author'],
            desc: element['description'],
            url: element['url'],
            urlToImage: element["urlToImage"],
            content: element["content"],
            publishedAt: element["publishedAt"]

          );
          news.add(articleModel);
        }

      });
    }
  }



}

class CategoryNews{
  List<ArticleModel>  news = [];


  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=apikey";//baseurl
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              authorName: element['author'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element["urlToImage"],
              content: element["content"],
              publishedAt: element["publishedAt"]

          );
          news.add(articleModel);
        }

      });
    }
  }

}