import 'package:flutter/material.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/widgets/live_fixtures.dart';

class LiveFixturesScreen extends StatefulWidget {
  @override
  _LiveFixturesScreenState createState() => _LiveFixturesScreenState();
}

class _LiveFixturesScreenState extends State<LiveFixturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LiveFixtures(),
    );
  }
}
