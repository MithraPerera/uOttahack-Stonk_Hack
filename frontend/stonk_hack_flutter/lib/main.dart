import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'stock.dart';

void main() => runApp(MaterialApp(title: 'Stonk Hack 4', home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Color FOREGROUND_COLOR = Color(0xff009688);
  static const Color BACKGROUND_COLOR = Color(0xffFFEFD6);
  static const Color SECONDARY_COLOR = Color(0xff004D40);
  static const Color TERTIARY_COLOR = Color(0xff6f615B);

  List<Stock> stockList = [];

  Future fetchStocksJSON() async {
    String url = '';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // If response was returned properly
      createStocksFromJSON(response.body);
    }
  }

  List<Stock> createStocksFromJSON(String jsonString) {
    /*
    Decode a JSON string and creates a List of Stock objects
     */
    List<Stock> _stocks = [];

    var stocksJson = json.decode(jsonString);
    for (var stockJson in stocksJson) {
      _stocks.add(Stock.fromJson(stockJson));
    }

    return _stocks;
  }

  @override
  void initState() {
    String jsonString = '''
    [
      {"ticker":"TSLA", "price":20, "covidScore":-1,  "sentimentScore":1},
      {"ticker":"NOK",  "price":20, "covidScore":-1,  "sentimentScore":1},
      {"ticker":"GME",  "price":20, "covidScore":-1,  "sentimentScore":1}
    ]
    ''';

    stockList = createStocksFromJSON(jsonString);
    stockList.forEach((s) => print(s.ticker));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: FOREGROUND_COLOR,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/5843.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text('SentimentStocks')),
            ),
          ],
        ),
      ),

      body: ListView(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Top Stocks',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: SECONDARY_COLOR, letterSpacing: 2.0),
            ),
          ),
        ),
        DataTable(
          columns: [
            DataColumn(label: Text(  
                    'TICKER',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FOREGROUND_COLOR, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'PRICE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FOREGROUND_COLOR, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'COVID SCORE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FOREGROUND_COLOR, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'SENTIMENT SCORE',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FOREGROUND_COLOR, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'BUY/SELL',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FOREGROUND_COLOR, letterSpacing: 2.0)  
                )),  
          ], rows: stockList.map((stock) => DataRow(
            cells: [
              DataCell(
                Text(
                  '${stock.ticker}',
                  style: TextStyle(
                    color: TERTIARY_COLOR,
                    fontWeight: FontWeight.bold,
                  )),
              ),
              DataCell(
                  Text(
                    '${stock.price}',
                    style: TextStyle(
                      color: TERTIARY_COLOR,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
              DataCell(
                  Text(
                    '${stock.covidScore}',
                    style: TextStyle(
                      color: TERTIARY_COLOR,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
              DataCell(
                Text(
                    '${stock.sentimentScore}',
                    style: TextStyle(
                      color: TERTIARY_COLOR,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              DataCell(
                Text(
                    'NOPE',
                    style: TextStyle(
                      color: TERTIARY_COLOR,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]
        )).toList()
        )
      ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('?'),
        backgroundColor: SECONDARY_COLOR,
      ),
    );
  }
}
