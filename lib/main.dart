import 'package:flutter/material.dart';
import 'package:football_app/main/widgets/today_fixtures.dart';
import 'package:football_app/main/screens/first_screen.dart';
import 'package:football_app/main/screens/fixtureDetails_screen.dart';
import 'package:football_app/main/screens/livefixtures_screen.dart';

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
