import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/News.dart';
import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:flutter_news_app/views/article.dart';

class CategoryView extends StatefulWidget {

  final String categoryNew;
  CategoryView({this.categoryNew});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCatNews();
  }

  getCatNews() async {
    CategoryNews news = new CategoryNews();
    await news.getNews(widget.categoryNew);

    articles = news.news;

    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, //for centre text
          children: <Widget>[
            /*Text("Flutter "),
            Text("News", style: TextStyle(
                color: Colors.black
            ),)*/
          ],
        ),
        elevation: 0.0, // elevation
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
        color: Colors.black,
        margin: EdgeInsets.only(bottom: 16),
        child: Column(

          children: <Widget>[
            ClipRRect(

                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              color: Colors.white
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

