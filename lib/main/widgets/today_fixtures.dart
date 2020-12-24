import 'package:football_app/main/utils/imports.dart';

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
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        match.showMatches = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //match.getUpcoming();
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
          child: match.showMatches == false
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
              : RefreshIndicator(
                  onRefresh: match.getUpcoming,
                  child: match.homeTeams.length > 0
                      ? ListView.builder(
                          //physics: AlwaysScrollableScrollPhysics(),
                          itemCount: match.homeTeams.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10.0,
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    //Navigator.pushNamed(context, '/');
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
                                          Container(
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
                                                      match.venueNames[index],
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
                                                      match.leagueNames[index],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                )
                                              : Text('Competition unknown'),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: <Widget>[
                                          match.countries[index] != null
                                              ? Text(
                                                  'Country: ' +
                                                      match.countries[index],
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
                              child: Text("No scheduled matches today",
                                  style: TextStyle(fontSize: 30.0))),
                        ),
                )),
    );
  }
}
