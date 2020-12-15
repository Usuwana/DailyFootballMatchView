import 'package:flutter/material.dart';

class Fixture extends StatefulWidget {
  @override
  _FixtureState createState() => _FixtureState();
}

class _FixtureState extends State<Fixture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        shadowColor: Colors.black,
        title: Center(
            child: Text('Match stats')
        ),
      ),
      body: Container(
        child: Row(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
