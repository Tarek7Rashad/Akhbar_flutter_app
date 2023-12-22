import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  final String url;

  // ignore: use_key_in_widget_constructors
  const WebView(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: WebView(url),
    );
  }
}
