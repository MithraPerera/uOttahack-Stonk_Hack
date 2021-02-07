import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Stonk Hack 4', home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int teslaPrice = 0;
  int nokiaPrice = 0;
  int gameStopPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.teal,
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
              child: Center(child: Text('Stonk Hack 4')),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'TICKER',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(
                      'PRICE',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(
                      'COVID SCORE',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(
                      'STONK SCORE',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(
                      'BUY/SELL',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 20.0),
            Divider(
              height: 60.0,
              color: Colors.white,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'TSLA',
                    style: TextStyle(
                      color: Colors.teal,
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Text(
                        'NOK',
                        style: TextStyle(
                          color: Colors.teal,
                          letterSpacing: 2.0,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '32.95',
                      style: TextStyle(
                        color: Colors.teal,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '-1',
                      style: TextStyle(
                        color: Colors.teal,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        color: Colors.teal,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'SELL',
                      style: TextStyle(
                        color: Colors.teal,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Container(
              child: Row(
                children: [
                  Text(
                    'GME',
                    style: TextStyle(
                      color: Colors.teal,
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('ADD'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
