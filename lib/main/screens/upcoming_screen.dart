import 'package:football_app/main/utils/imports.dart';

class TodayFixturesScreen extends StatefulWidget {
  @override
  _TodayFixturesScreenState createState() => _TodayFixturesScreenState();
}

class _TodayFixturesScreenState extends State<TodayFixturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodayFixtures(),
    );
  }
}
