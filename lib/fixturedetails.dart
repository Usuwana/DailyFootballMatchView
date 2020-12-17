import 'package:flutter/material.dart';
import 'package:football_app/Data/match.dart';

class FixtureDetails extends StatefulWidget {
  @override
  _FixtureDetailsState createState() => _FixtureDetailsState();
}

class _FixtureDetailsState extends State<FixtureDetails> {
  Match match = new Match();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
            'Match Details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0)
        ),
      ),
    );
  }
}
