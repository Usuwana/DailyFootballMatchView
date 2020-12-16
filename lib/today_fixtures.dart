import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:football_app/Data/match.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TodayFixtures extends StatefulWidget {
  @override
  _TodayFixturesState createState() => _TodayFixturesState();
}

class _TodayFixturesState extends State<TodayFixtures> {
  Match match = new Match();

  @override
  void initState() {
    match.getUpcoming();
    super.initState();
    print(match.homeTeams);
    print(match.homeTeams.length);
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        match.showMatches = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    match.getUpcoming();
    print(match.homeTeams);
    print(match.homeTeams.length);
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Center(
          child: Text(
            'Matches today',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: match.getUpcoming,
        child: /*homeTeams.length > 0
            ?*/ ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
                itemCount: match.homeTeams.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10.0,
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        title: Center(
                            child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Text(match.homeTeams[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                Spacer(),
                                match.status[index] == 'in progress'
                                    ? Container(
                                        color: Colors.blue[900],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              match.homeScores[index] +
                                                  '-' +
                                                  match.awayScores[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25.0)),
                                        ),
                                      )
                                    : Container(
                                        color: Colors.red[600],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(' VS ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25.0)),
                                        ),
                                      ),
                                Spacer(),
                                Text(match.awayTeams[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                match.status[index] == 'in progress'
                                    ? Text(match.times[index],
                                        style: TextStyle(fontSize: 10.0))
                                    : Text(''),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Status: ' + match.status[index],
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Venue: ' + match.venueNames[index],
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  match.leagueNames[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                })
            /*: Center(
                child: Container(
                    color: Colors.white,
                    child: Text("No scheduled matches today",
                        style: TextStyle(fontSize: 30.0))),
              ),*/
      )),
    );
  }
}