import 'package:football_app/main/utils/imports.dart';

class FixtureDetailsScreen extends StatefulWidget {
  @override
  _FixtureDetailsScreenState createState() => _FixtureDetailsScreenState();
}

class _FixtureDetailsScreenState extends State<FixtureDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FixtureDetails(),
    );
  }
}
