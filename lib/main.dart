import 'package:flutter/material.dart';
import 'package:youtubescreen/screen/home.dart';
import 'package:youtubescreen/screen/youtube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // 初期画面のclassを指定
        '/': (context) => Home(),
        // 次ページのclassを指定
        '/Youtube': (context) => Youtube(),
      },
    );
  }
}
