import 'package:football_app/main/utils/imports.dart';

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
