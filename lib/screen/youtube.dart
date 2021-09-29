import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 遷移先の画面の作成
class Youtube extends StatelessWidget {
  double cellWidth = 0;
  final double cellHeight = 50;

  String channelName = 'チャンネル名';
  int playTimes = 0;
  String distributionTime = '配信開始時間';

  // なぜか追加された。
  Youtube({Key? key}) : super(key: key);

  // AppBarのサイズ測定のため、グローバル変数としてGlobalKey型の変数（プロパティ）を定義
  GlobalKey globalKeyAppBar = GlobalKey();


  // 表示中の Widget を取り出すための index としての int 型の mutable な stored property
  int _selectedIndex = 0;

  // 表示する Widget の一覧
  static final List<Widget> _pageList = [
    Body(340, 50),
    Body(340, 50),
    Body(340, 50),
    Body(340, 50),
    Body(340, 50),
  ];


  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;
    // 画面の横幅を取得
    final double width = size.width;
    // 画面の縦幅を取得
    final double height = size.height;
    // Itemのcellの幅を取得
    cellWidth = width / 2;

    var appBarHeight = AppBar().preferredSize.height;


    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // 戻るボタンを非表示にする
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,

        // ボタンの配置
        actions: <Widget>[
          // youtubeアイコン
          SizedBox(
            height: appBarHeight,
            width: 100,
            child: TextButton(
              onPressed: () {
                print('youtubeアイコンがタップされました');
              },
              child: Image.asset(
                'images/youtubeicon.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Spacer(),
          _createFunctionButton(Icons.cast, '画面共有ボタンがタップされました'),
          _createFunctionButton(Icons.notifications_none, '通知ボタンがタップされました'),
          _createFunctionButton(Icons.search_rounded, '検索ボタンがタップされました'),
          _createFunctionButton(Icons.account_circle, 'アカウントボタンがタップされました'),
        ],
      ),

      // 本体の記述
      body: Body(cellWidth, cellHeight),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  // AppBarの機能ウィジェットの作成
  Widget _createFunctionButton(IconData icon, String printText) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            print(printText);
          },
        ),
      ],
    );
  }
}


// 項目ボタン作成
Widget _createItemButton(String? text, IconData? iconName, Color? color, double cellWidth, double cellHeight) {
  if (iconName == null) {
    return Visibility(
      visible: true,
      child: SizedBox(
        width: cellWidth - 20,
        height: cellHeight,
      ),
    );
  }
  return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(cellWidth - 20, cellHeight),
            primary: color,
          ),
          onPressed: () {
            print('$textがタップされました');
          },
          child: Row(
              children: [
                Icon(iconName),
                Text(text ?? ''),
              ]
          )
      )
  );
}

Widget ItemView(double cellWidth, double cellHeight) {
  return Container(
    color: Colors.black,
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _createItemButton('急上昇', Icons.local_fire_department_sharp,
              Colors.red, cellWidth, cellHeight),
          _createItemButton(
              '音楽', Icons.music_note, Colors.green, cellWidth, cellHeight),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _createItemButton(
              'ゲーム', Icons.videogame_asset, Colors.pink, cellWidth, cellHeight),
          _createItemButton(
              'ニュース', Icons.text_snippet, Colors.blue, cellWidth, cellHeight),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _createItemButton(
              '学び', Icons.lightbulb, Colors.lightGreen, cellWidth, cellHeight),
          _createItemButton('ライブ', Icons.live_tv_outlined, Colors.orange,
              cellWidth, cellHeight),
        ]),
        //Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //  _createItemButton(
        //      'スポーツ', Icons.sports, Colors.lightBlue, cellWidth, cellHeight),
        //  _createItemButton(null, null, null, cellWidth, cellHeight)
        //]),
      ],
    ),
  );
}


// ビデオの表示を行うウィジェット
Widget VideoView(String image, String title, String channelName, int playTimes, String distributionTime) {
  return Column(
    children: [
      Image.asset(image),
      Row(
        // アイコンを表示
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.account_circle),
          ),
          // 名前を表示
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                Text('$channelName・$playTimes回・$distributionTime',
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          //const Spacer(),
          TextButton(
            onPressed: () {
              print('動画詳細がタップされました');
            },
            child: const Icon(Icons.arrow_drop_down_sharp),
            style: TextButton.styleFrom(
              //primary: Colors.white,
              primary: Colors.black,
            ),
          ),
        ],
      ),
    ],
  );
}


// Bodyの作成
Widget Body(double cellWidth, double cellHeight) {
  return ListView(
    children: [
      ItemView(cellWidth, cellHeight),

      // 急上昇動画
      Container(
        //crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.only(top: 5, left: 10, bottom: 15),
        child: const Text('急上昇動画',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),

      // 動画一覧
      VideoView('images/arashi.png', '動画タイトル', 'チャンネル名', 18475849, '3時間前'),
      VideoView('images/arashi.png', '動画タイトル', 'チャンネル名', 18475849, '3時間前'),
    ],
  );
}


// BottomBarButtonの作成
Widget bottomNavigationBar() {
  int _currentIndex = 0;

  return BottomNavigationBar(
    currentIndex: _currentIndex,
    fixedColor: Colors.blueAccent,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: '検索',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add_circle_outline,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.video_library_sharp,
        ),
        label: 'チャンネル',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.video_library_sharp,
        ),
        label: 'ライブラリ',
      ),
    ],
  );
}