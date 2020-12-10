import 'dart:async';

import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetail extends StatefulWidget {
  final String imageUrl;

  NewsDetail({this.imageUrl});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
      body: Container(
        child: WebView(
          initialUrl: widget.imageUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
