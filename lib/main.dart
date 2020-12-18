import 'package:flutter/material.dart';
import 'package:football_app/today_fixtures.dart';
import 'package:football_app/first_screen.dart';
import 'package:football_app/Data/fixtureDetails_screen.dart';
import 'package:football_app/Data/livefixtures_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/upcoming': (context) => TodayFixtures(),
      '/live': (context) => LiveFixturesScreen(),
      '/details': (context) => FixtureDetailsScreen(),
    },
  ));
}
