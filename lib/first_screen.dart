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
          title: Text(
        'Football Application',
        style: TextStyle(color: Colors.white),
      )),
      body: RaisedButton(
        color: Colors.black,
        onPressed: () {},
        child: Text('Show scheduled fixtures'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Text('Show live fixtures'),
      ),
    );
  }
}
