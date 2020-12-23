import 'package:flutter/material.dart';
import 'file:///C:/Users/tatem/Documents/FlutterStuff/My_apps/football_app/lib/main/widgets/teamInfo.dart';

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
