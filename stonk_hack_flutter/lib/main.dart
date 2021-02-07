import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'stock.dart';

const Color FOREGROUND_COLOR = Color(0xff009688);
const Color BACKGROUND_COLOR = Color(0xffFFEFD6);
const Color SECONDARY_COLOR = Color(0xff004D40);
const Color TERTIARY_COLOR = Color(0xff6f615B);

void main() => runApp(MaterialApp(title: 'SentimentStocks', home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // static const Color FOREGROUND_COLOR = Color(0xff009688);
  // static const Color BACKGROUND_COLOR = Color(0xffFFEFD6);
  // static const Color SECONDARY_COLOR = Color(0xff004D40);
  // static const Color TERTIARY_COLOR = Color(0xff6f615B);

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
    fetchStocksJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: FOREGROUND_COLOR,
        elevation: 20.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/5843.png',
              fit: BoxFit.cover,
              height: 45.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                'SentimentStocks',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Watchlist',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: SECONDARY_COLOR,
                    letterSpacing: 2.0),
              ),
            ),
          ),
          Divider(
            height: 20.0,
            color: Colors.black,
          ),
          DataTable(
              columns: [
                DataColumn(
                    label: Text('TICKER',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: FOREGROUND_COLOR,
                            letterSpacing: 2.0))),
                DataColumn(
                    label: Text('PRICE',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: FOREGROUND_COLOR,
                            letterSpacing: 2.0))),
                DataColumn(
                    label: Text('COVID SCORE',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: FOREGROUND_COLOR,
                            letterSpacing: 2.0))),
                DataColumn(
                    label: Text('SENTIMENT SCORE',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: FOREGROUND_COLOR,
                            letterSpacing: 2.0))),
                DataColumn(
                    label: Text('BUY/SELL',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: FOREGROUND_COLOR,
                            letterSpacing: 2.0))),
              ],
              rows: stockList
                  .map((stock) => DataRow(cells: [
                        DataCell(
                          Text('${stock.ticker}',
                              style: TextStyle(
                                color: TERTIARY_COLOR,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataCell(
                          Text('${stock.price}',
                              style: TextStyle(
                                color: TERTIARY_COLOR,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataCell(
                          Text('${stock.covidScore}',
                              style: TextStyle(
                                color: TERTIARY_COLOR,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataCell(
                          Text('${stock.sentimentScore}',
                              style: TextStyle(
                                color: TERTIARY_COLOR,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataCell(
                          Text('NOPE',
                              style: TextStyle(
                                color: TERTIARY_COLOR,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ]))
                  .toList())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('?'),
        backgroundColor: SECONDARY_COLOR,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text(
      'How does it work?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: SECONDARY_COLOR,
      ),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Covid Score",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FOREGROUND_COLOR,
          ),
        ),
        Text(
            "We provide our customers with a metric that indicates how at risk a stock is to the effects of COVID-19 through our advanced statiscal algorithms that crunch the numbers so you don't have to. We do the heavy lfiting to keep our clients safe from the uncertainity of the time and hope to keep our clients healthy in mind, body and wallet!"),
        Text(
          "Scale: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TERTIARY_COLOR,
          ),
        ),
        Text(
          "1(GOOD) to 5(HIGH RISK)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TERTIARY_COLOR,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Sentiment Score",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FOREGROUND_COLOR,
          ),
        ),
        Text(
            "With the increase in retail investors in the market from 9 year olds to teenage boys looking to gamble away their birthday money, the stock market has changed and can no longer be analyzed by technical analysis alone. Using our state of the art machine learning and natural language processing models, we are able to acurately determine the public sentiment of a particular stock to help our users determine whether they want to add a stock to their portfolio."),
        Text(
          "Scale: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TERTIARY_COLOR,
          ),
        ),
        Text(
          "1(GOOD) to 5(HIGH RISK)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TERTIARY_COLOR,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Our Recommendation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FOREGROUND_COLOR,
          ),
        ),
        Text(
            "We give our recommendation based on the analysis of both the COVID and Sentiment scores. However, SentimentStocks takes no liability for the success or failure you get through our recommendations."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
