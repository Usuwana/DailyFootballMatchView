import 'package:football_app/main/utils/imports.dart';

class LiveFixtures extends StatefulWidget {
  @override
  _LiveFixturesState createState() => _LiveFixturesState();
}

class _LiveFixturesState extends State<LiveFixtures> {
  Match match = new Match();

  @override
  void initState() {
    //match.getInPlay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //match.getInPlay();
    print(match.homeTeams);
    print(match.homeTeams.length);
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Center(
          child: Text(
            'Current matches',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: /*match.showMatches == false
              ? ListView.builder(
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 1),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(15.0)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 6.0,
                                          width: 200.0,
                                          color: Colors.black),
                                    ),
                                    Padding(padding: EdgeInsets.all(2.0)),
                                    Container(
                                        height: 6.0,
                                        width: 300.0,
                                        color: Colors.black),
                                    Padding(padding: EdgeInsets.all(2.0)),
                                    Container(
                                        height: 6.0,
                                        width: 350.0,
                                        color: Colors.black),
                                    Padding(padding: EdgeInsets.all(2.0)),
                                    Container(
                                        height: 6.0,
                                        width: 350.0,
                                        color: Colors.black),
                                    Padding(padding: EdgeInsets.all(5.0)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      baseColor: Colors.grey[600],
                      highlightColor: Colors.grey[100],
                    );
                  })
              : */
              FutureBuilder(
                  future: match.getInPlay(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RefreshIndicator(
                        //This needs fixing, It refreshes the data but does not refresh the display on screen
                        onRefresh: () async {
                          //match.getInPlay();
                          setState(() {
                            /*match.homeTeams.clear();
                          match.awayTeams.clear();
                          match.status.clear();
                          match.venueNames.clear();
                          match.leagueNames.clear();
                          match.homeScores.clear();
                          match.awayScores.clear();
                          match.times.clear();
                          //match.getInPlay();
                          //initState();
                          //build(context);*/
                            Navigator.pushReplacementNamed(context, '/live');
                          });
                        },
                        //onRefresh: () async {
                        // (context as Element).reassemble();
                        //  },
                        child: match.homeTeams.length > 0
                            ? ListView.builder(
                                itemCount: match.homeTeams.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 10.0,
                                    child: Center(
                                      child: ListTile(
                                        onTap: () {
                                          /*match.getLineUps(
                                            match.fixtureIDs[index],
                                            match.homeTeamIDs[index],
                                            match.awayTeamIDs[index],
                                            match.homeScores[index],
                                            match.awayScores[index]);*/
                                          Match.num = index;
                                          //Navigator.pushNamed(context, '/details');
                                        },
                                        title: Center(
                                            child: Column(
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                Text(match.homeTeams[index],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0)),
                                                Spacer(),
                                                Container(
                                                  color: Colors.blue[900],
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        match.homeScores[
                                                                index] +
                                                            '-' +
                                                            match.awayScores[
                                                                index],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25.0)),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(match.awayTeams[index],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0)),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(match.times[index],
                                                    style: TextStyle(
                                                        fontSize: 10.0)),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                match.status[index] != null
                                                    ? Text(
                                                        'Status: ' +
                                                            match.status[index],
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    : Text('Status unknown'),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: <Widget>[
                                                match.venueNames[index] != null
                                                    ? Text(
                                                        'Venue: ' +
                                                            match.venueNames[
                                                                index],
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      )
                                                    : Text('Venue unknown'),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                match.leagueNames[index] != null
                                                    ? Text(
                                                        'Competition: ' +
                                                            match.leagueNames[
                                                                index],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      )
                                                    : Text(
                                                        'Competition unknown'),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: <Widget>[
                                                match.countries[index] != null
                                                    ? Text(
                                                        'Country: ' +
                                                            match.countries[
                                                                index],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      )
                                                    : Text('Country unknown'),
                                              ],
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: Container(
                                    color: Colors.white,
                                    child: Text(
                                        "No matches currently being played",
                                        style: TextStyle(fontSize: 30.0))),
                              ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return ListView.builder(
                        itemCount: 18,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            period: Duration(seconds: 1),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(15.0)),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                                height: 6.0,
                                                width: 200.0,
                                                color: Colors.black),
                                          ),
                                          Padding(padding: EdgeInsets.all(2.0)),
                                          Container(
                                              height: 6.0,
                                              width: 300.0,
                                              color: Colors.black),
                                          Padding(padding: EdgeInsets.all(2.0)),
                                          Container(
                                              height: 6.0,
                                              width: 350.0,
                                              color: Colors.black),
                                          Padding(padding: EdgeInsets.all(2.0)),
                                          Container(
                                              height: 6.0,
                                              width: 350.0,
                                              color: Colors.black),
                                          Padding(padding: EdgeInsets.all(5.0)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            baseColor: Colors.grey[600],
                            highlightColor: Colors.grey[100],
                          );
                        });
                  })),
    );
  }
}
