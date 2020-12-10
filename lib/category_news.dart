import "package:flutter/material.dart";
import './helper/news.dart';
import 'models/article.dart';
import 'news_detail.dart';

class CategoryNews extends StatefulWidget {
  final String categoryPick;

  const CategoryNews({this.categoryPick});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<Article> articles = new List<Article>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass categoryNews = CategoryNewsClass();
    await categoryNews.categorygetNews(widget.categoryPick);
    articles = categoryNews.categorynews;
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
      body: isLoading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
              child: Container(
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
      )
    );
  }
}
