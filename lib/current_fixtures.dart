import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:football_app/Data/match.dart';

class CurrentFixtures extends StatefulWidget {
  @override
  _CurrentFixturesState createState() => _CurrentFixturesState();
}

class _CurrentFixturesState extends State<CurrentFixtures> {
  Match match = new Match();

  @override
  void initState() {
    super.initState();
    //match.getInPlay();
    match.getUpcoming();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        match.showMatches = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
            itemCount: match.homeTeams.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10.0,
                child: Center(
                  child: ListTile(
                    onTap: () {},
                    title: Center(
                      child: match.showMatches
                          ? Column(
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  match.homeScores[index] +
                                                      '-' +
                                                      match.awayScores[index],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25.0)),
                                            ),
                                          )
                                        : Container(
                                            color: Colors.red[600],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(' VS ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                            )
                          : Shimmer.fromColors(
                              direction: ShimmerDirection.ltr,
                              period: Duration(seconds: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 48.0,
                                        width: 48.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              height: 6.0,
                                              width: 100.0,
                                              color: Colors.black),
                                          Padding(padding: EdgeInsets.all(2.0)),
                                          Container(
                                              height: 6.0,
                                              width: 100.0,
                                              color: Colors.black),
                                          Padding(padding: EdgeInsets.all(2.0)),
                                          Container(
                                              height: 6.0,
                                              width: 100.0,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              baseColor: Colors.grey[600],
                              highlightColor: Colors.grey[100],
                              //period: Duration(seconds: 5),
                            ),
                    ),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
