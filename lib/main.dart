import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//グラフの値を定義
List<int> b1 = [4210145, 5390012, 5518215, 6604207, 7603910, 7002311];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('charts'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: Text(
                '営業利益',
                style: TextStyle(
                    fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.all(20),
            ),
            Container(
              height: size.height * 0.5,
              child: getBar(),
            ),
            TableWidget()
          ],
        ),
      ),
    );
  }

//棒グラフ
  Widget getBar() {
    List<Barsales> dataBar = [
      //値を表示
      new Barsales("2016", b1[0]),
      new Barsales("2017", b1[1]),
      new Barsales("2018", b1[2]),
      new Barsales("2019", b1[3]),
      new Barsales("2020", b1[4]),
      new Barsales("2021", b1[5]),
    ];
//説明が難しい
    var seriesBar = [
      charts.Series(
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

//表のコード
class TableWidget extends StatelessWidget {
  TableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          color: Colors.blue,
        ),
        child: DataTable(
          columns: <DataColumn>[
            //上段のコード
            DataColumn(
              label: Text(
                '営業利益',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2016',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2017',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2018',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2019',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2020',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2021',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              //下段のコード
              cells: <DataCell>[
                DataCell(Text('Sarah')),
                DataCell(Text(b1[0].toString())),
                DataCell(Text(b1[1].toString())),
                DataCell(Text(b1[2].toString())),
                DataCell(Text(b1[3].toString())),
                DataCell(Text(b1[4].toString())),
                DataCell(Text(b1[5].toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
