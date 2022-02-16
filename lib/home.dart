import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'login.dart';
import 'table.dart';

//グラフの値を定義
List<int> graph1 = [4210145, 5390012, 5518215, 6604207, 7603910, 7002311];
List<int> graph2 = [184739, 210273, 212256, 215530, 150586, 245671];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //↓ここを変更
        title: const Text('業績アプリ'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // ログアウト処理
              // 内部で保持しているログイン情報等が初期化される
              // （現時点ではログアウト時はこの処理を呼び出せばOKと、思うぐらいで大丈夫です）
              await FirebaseAuth.instance.signOut();
              // ログイン画面に遷移＋チャット画面を破棄
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
              );
            },
          ),
        ],
      ),
      body: Container(
        //グラフを並べる
        child: ListView(
          children: <Widget>[
            Container(
              //タイトル
              child: Text(
                '営業利益',
                style: TextStyle(
                    fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
              ),
              margin: const EdgeInsets.all(20),
            ),
            //棒グラフ
            Container(
              height: 340,
              child: getBar(),
            ),
            //表
            //コードはtable.dartに
            TableWidget(
              graphtype: graph1,
            ),
            //タイトル2
            Container(
              child: Text(
                '営業利益',
                style: TextStyle(
                    fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
              ),
              margin: const EdgeInsets.all(20),
            ),
            //棒グラフ2
            Container(
              height: 340,
              child: getBar2(),
            ),
            //表2
            //コードはtable.dartに
            TableWidget(
              graphtype: graph2,
            ),
          ],
        ),
      ),
    );
  }

//赤い棒グラフ
  Widget getBar() {
    List<Barsales> dataBar = [
      //値を表示
      Barsales("2016", graph1[0]),
      Barsales("2017", graph1[1]),
      Barsales("2018", graph1[2]),
      Barsales("2019", graph1[3]),
      Barsales("2020", graph1[4]),
      Barsales("2021", graph1[5]),
    ];

//説明が難しい
    var seriesBar = [
      charts.Series(
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        data: dataBar,
        domainFn: (Barsales sales, _) => sales.day,
        measureFn: (Barsales sales, _) => sales.sale,
        id: "Sales",
      )
    ];
    return charts.BarChart(seriesBar);
  }

//緑の棒グラフ
  Widget getBar2() {
    List<Barsales> dataBar = [
      //値を表示
      Barsales("2016", graph2[0]),
      Barsales("2017", graph2[1]),
      Barsales("2018", graph2[2]),
      Barsales("2019", graph2[3]),
      Barsales("2020", graph2[4]),
      Barsales("2021", graph2[5]),
    ];

//説明が難しい
    var seriesBar = [
      charts.Series(
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: dataBar,
        domainFn: (Barsales sales, _) => sales.day,
        measureFn: (Barsales sales, _) => sales.sale,
        id: "Sales",
      )
    ];
    return charts.BarChart(seriesBar);
  }
}

//よくわからん
class Barsales {
  String day;
  int sale;
  Barsales(this.day, this.sale);
}

//よくわからん
class Linesales {
  DateTime time;
  int sale;
  Linesales(this.time, this.sale);
}
