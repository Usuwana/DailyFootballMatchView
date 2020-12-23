import 'package:flutter/material.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/widgets/today_fixtures.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/screens/first_screen.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/screens/fixtureDetails_screen.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/screens/livefixtures_screen.dart';

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
