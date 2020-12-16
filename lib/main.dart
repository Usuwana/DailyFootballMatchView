import 'package:flutter/material.dart';
import 'package:football_app/current_fixtures.dart';
import 'package:football_app/fixture.dart';
import 'package:football_app/first_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      //'/current': (context) => CurrentFixtures(),
      //'/fixture': (context) => Fixture(),
    },
  ));
}
