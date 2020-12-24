import 'package:football_app/main/utils/imports.dart';

class FixtureDetails extends StatefulWidget {
  @override
  _FixtureDetailsState createState() => _FixtureDetailsState();
}

class _FixtureDetailsState extends State<FixtureDetails> {
  Match match = new Match();

  @override
  void initState() {
    match.getInPlay();
    match.getLineUps(
        match.fixtureIDs[Match.num],
        match.homeTeamIDs[Match.num],
        match.awayTeamIDs[Match.num],
        match.homeScores[Match.num],
        match.awayScores[Match.num]);
    print('Yes! ' + match.fixtureIDs[Match.num]);
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        match.showMatches = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Match Details',
            style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blueGrey[50],
                  child: Row(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.all(12.0)),
                      Text(
                        match.stHome,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(padding: const EdgeInsets.all(18.0)),
                      Container(
                          color: Colors.indigo[900],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              match.scoreH.toString() +
                                  '-' +
                                  match.scoreA.toString(),
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          )),
                      Padding(padding: const EdgeInsets.all(18.0)),
                      Text(
                        match.stAway,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 430.0,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Time'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('HT score'),
                      Spacer(),
                      Text('FT score'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 430.0,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Line-Ups',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 100.0,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(match.stHome,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 70.0)),
                    Text(match.stAway,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          color: Colors.grey[350],
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 11,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(match.homeLineup[index]),
                                );
                              })),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.grey[350],
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 11,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(match.awayLineup[index]),
                                );
                              })),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
