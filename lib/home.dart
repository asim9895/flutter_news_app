import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_news_app/category_news.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/models/category.dart';
import 'package:flutter_news_app/news_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<Article> articles = new List<Article>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();

    getAllNews();
  }

  getAllNews() async {
    News allNews = News();
    await allNews.getNews();
    articles = allNews.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: "Flutter",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: "News",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(padding: EdgeInsets.only(left: 10));
                      }
                      return CategoryTile(
                          categoryName: categories[index].categoryName,
                          imageUrl: categories[index].imageUrl);
                    }),
              ),
              isLoading
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsDetail(imageUrl: articles[index].url,)));
                              },
                              child:  Container(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            articles[index].urlToImage)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(articles[index].title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(articles[index].description,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    )
                                  ],
                                
                            ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  const CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(categoryPick: categoryName.toString().toLowerCase(),) ));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}


                              