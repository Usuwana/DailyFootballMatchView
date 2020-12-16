import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void setupFixtures() {
    Navigator.pushNamed(context, '/current');
  }

  @override
  void initState() {
    super.initState();
    //setupFixtures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
          title: Center(
        child: Text(
          'Football Application',
          style: TextStyle(color: Colors.white),
        ),
      )),
      body: Center(
        child: RaisedButton(
          color: Colors.black,
          onPressed: () {},
          child: Text(
            'Scheduled fixtures',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: Container(
        //width: 100.0,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Center(
              child: Text('live fixtures', style: TextStyle(fontSize: 12.0))),
        ),
      ),
    );
  }
}
