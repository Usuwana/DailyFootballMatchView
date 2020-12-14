import 'package:flutter/material.dart';
import 'package:football_app/first_screen.dart';
import 'package:football_app/current_fixtures.dart';
import 'package:football_app/fixture.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/current',
    routes: {
     // '/': (context) => FirstScreen(),
      '/current': (context) => CurrentFixtures(),
      '/fixture': (context) => Fixture(),
    },
  ));
}


