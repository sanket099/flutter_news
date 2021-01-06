

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/Data.dart';
import 'package:flutter_news_app/helper/News.dart';
import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:flutter_news_app/models/CategoryModel.dart';
import 'package:flutter_news_app/views/article.dart';
import 'package:flutter_news_app/views/category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;
  @override
  void initState() { //dont use async here
    // TODO: implement initState
    super.initState();
    //first thing when page loaded
    categories = getCategories();
    getNews();

  }
  getNews() async{
    News news = new News();
    await news.getNews();

    articles = news.news;

    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, //for centre text
          children: <Widget>[
            Text("Flutter ", style: TextStyle(
              color: Colors.white
            ),),
            Text("News", style: TextStyle(
              color: Colors.white
            ),)
          ],
        ),
        elevation: 0.0, // elevation
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[

              /// categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal
                    ,itemBuilder:(context,index){
                  return CategoryCard(
                    imgUrl: categories[index].imagUrl,
                    categoryName: categories[index].categoryName,
                  );
                }),
              ),
              ///Blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(), //tofix scroll
                    itemBuilder:  (context, index){
                    return BlogCard(
                      imgUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].desc,
                      url: articles[index].url,
                    );
                    }),
              )
            ],
          ) ,
        ),
      ),
     );
  }
}

class CategoryCard extends StatelessWidget {
  final String imgUrl, categoryName;

  CategoryCard({this.imgUrl , this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //perform function
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryView(
            categoryNew: categoryName.toLowerCase()
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack( //layers //relative layout
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6), // corners
              child: CachedNetworkImage(imageUrl: imgUrl,
              width: 120, height: 60, fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26
              ), // gray backdrop
              child: Text(categoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500

              ),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imgUrl, title, desc, url;
  BlogCard({this.imgUrl,this.title,this.desc, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Article(
            url: url,
          )
        ));
      },


       //activity new
      child: Container(
        color: Colors.black54,
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500

            ),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(
              fontSize: 14,
              color: Colors.white54

            ),),
          ],
        ),
      ),
    );
  }
}

