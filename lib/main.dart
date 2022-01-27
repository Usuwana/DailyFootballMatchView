import 'package:football_app/main/utils/imports.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/upcoming': (context) => TodayFixturesScreen(),
      '/live': (context) => LiveFixturesScreen(),
    },
  ));
}
