import 'package:flutter/material.dart';
import 'package:youtubescreen/screen/youtube.dart';


// 初期画面の作成
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 中央寄せを設定
        centerTitle: true,
        // タイトル設定
        title: Text('メイン画面'),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: Text('Youtube'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Youtube(),
                    ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
