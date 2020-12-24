import 'package:football_app/main/utils/imports.dart';

class TeamInfoScreen extends StatefulWidget {
  @override
  _TeamInfoScreenState createState() => _TeamInfoScreenState();
}

class _TeamInfoScreenState extends State<TeamInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TeamInfo(),
    );
  }
}
