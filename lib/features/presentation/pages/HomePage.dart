import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }
    Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: WillPopScope(
      onWillPop: _onBackPressed,
        child: Container(
          child: SafeArea(  
           child: Center(
            child: WebView(
              userAgent: "random",
              initialUrl: 'https://houseofjobss.com',
              javascriptMode: JavascriptMode.unrestricted,
              debuggingEnabled: true,
              
            ),
           ),
          ),
        ),
    ),
    );
  }
}