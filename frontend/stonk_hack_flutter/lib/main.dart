import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stonk Hack 4'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[800],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('Stock 1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.yellow,
              child: Text('Stock 2'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.green,
              child: Text('Stock 3'),
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('REC'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
