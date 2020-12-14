import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football_app/current_fixtures.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  void setupFixtures()
  {
    Navigator.pushNamed(context, '/current');
  }

  @override
  void initState()  {
    super.initState();
    //setupFixtures();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/current');
          },
          child: Text('View Matches',
          style: TextStyle(color: Colors.white, fontSize: 30)),
        )
      )

    );
  }
}
