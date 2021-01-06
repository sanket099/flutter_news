import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Article extends StatefulWidget {
  final String url;
  Article({this.url});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, //for centre text
          children: <Widget>[
            Text("Flutter "),
            Text("News", style: TextStyle(
                color: Colors.black
            ),)
          ],
        ),
        elevation: 0.0, // elevation
      ),
      body: Container(
        child: WebView(
          initialUrl:widget.url ,

          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),

    );
  }
}
