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
      //backgroundColor: Colors.grey[900],
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

      body: ListView(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Stonk Picks',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 2.0),
            ),
          ),
        ),
        DataTable(
          columns: [
            DataColumn(label: Text(  
                    'TICKER',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'PRICE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'COVID SCORE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'STONK SCORE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'BUY/SELL',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
          ], rows: [
             DataRow(cells: [  
                  DataCell(Text('TSLA')),  
                  DataCell(Text('35.97')),  
                  DataCell(Text('1')),
                  DataCell(Text('-1')),
                  DataCell(Text('SELL')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('NOK')),  
                  DataCell(Text('10.17')),  
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('BUY')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('GME')),  
                  DataCell(Text('359.57')),  
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('BUY')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('AMC')),  
                  DataCell(Text('24.76')),  
                  DataCell(Text('1')),
                  DataCell(Text('-1')),
                  DataCell(Text('SELL')),  
                ]),  
          ],)
      ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('?'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
