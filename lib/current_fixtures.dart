import 'package:flutter/material.dart';
import 'package:football_app/Data/matchDetails.dart';
import 'Data/match.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CurrentFixtures extends StatefulWidget {
  @override
  _CurrentFixturesState createState() => _CurrentFixturesState();
}

class _CurrentFixturesState extends State<CurrentFixtures> {

  int matchDay;
  bool sameDay;
  List<dynamic> matches;
  String homeTeam;
  String awayTeam;
  String date;
  String matchStatus;
  String venueName;
  String leagueName;
  int homeScore;
  int home90;
  int away90;
  int homeET;
  int awayET;
  int homePEN;
  int awayPEN;
  int home1st;
  int away1st;
  int home2nd;
  int away2nd;
  int timeElapsed;
  int awayScore;
  List<String> homeTeams = new List();
  List<String> awayTeams = new List();
  List<int> matchdays = new List();
  List<DateTime> dates;
  List<String> status = new List();
  List<String> venueNames = new List();
  List<String> leagueNames = new List();
  List<String> homeScores = new List();
  List<String> awayScores = new List();
  List<String> times = new List();
  bool showMatches = false;
  bool inPlay = false;
  //int numOfMatches;
  String testString = "Testing";
  String noToday = "No matches scheduled for today";
  String noNow = "No matches currently being played";


  @override
  void initState() {
    super.initState();
    //getInPlay();
    //getUpcoming();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        showMatches = true;
      });
    });
  }

  Future<void> getInPlay() async {
    //make the request
    Response response = await get(
        'https://elenasport-io1.p.rapidapi.com/v2/inplay',
        headers: {"x-rapidapi-key": "c4785495fdmshece188a6182be5ap1dabf2jsn53061cf2749f"});
    Map data = jsonDecode(response.body);
    matches = data['data'];
    //cur = matches.length;
    DateTime now = new DateTime.now();
    DateTime dateToday = new DateTime(now.year, now.month, now.day);
    int i=0;
    int j=0;

    try {

    while(i<data.length) {
        while (j < matches.length) {
          homeTeam = data['data'][j]['homeName'];
          awayTeam = data['data'][j]['awayName'];
          matchStatus = data['data'][j]['status'];
          venueName = data['data'][j]['venueName'];
          leagueName = data['data'][j]['leagueName'];
          date = data['data'][j]['date'];
          matchDay = data['data'][j]['round'];
          home90 = data['data'][j]['team_home_90min_goals'];
          away90 = data['data'][j]['team_away_90min_goals'];
          homeET = data['data'][j]['team_home_ET_goals'];
          awayET = data['data'][j]['team_away_ET_goals'];
          homePEN = data['data'][j]['team_home_PEN_goals'];
          awayPEN = data['data'][j]['team_away_PEN_goals'];
          home1st = data['data'][j]['team_home_1stHalf_goals'];
          away1st = data['data'][j]['team_away_1stHalf_goals'];
          home2nd = data['data'][j]['team_home_2ndHalf_goals'];
          away2nd = data['data'][j]['team_away_2ndHalf_goals'];
          timeElapsed = data['data'][j]['elapsed'];
          homeScore = homeET + home1st + home2nd;
          awayScore = awayET + away1st + away2nd;
          DateTime day = DateTime.parse(date);
          day = new DateTime(day.year, day.month, day.day);
          setState(() {
            homeTeams.add(homeTeam);
            awayTeams.add(awayTeam);
            matchdays.add(matchDay);
            status.add(matchStatus);
            venueNames.add(venueName);
            leagueNames.add(leagueName);
            homeScores.add(homeScore.toString());
            awayScores.add(awayScore.toString());
            times.add(timeElapsed.toString());
          });
          j++;
          i++;
        }
      }
    }
    catch (e)
    {
      print(e);
      homeTeams.add("No matches currently in play");
    }
    //numOfMatches = numOfMatches + matches.length;
  }

  Future<void> getUpcoming() async {
    //make the request
    /*Response response = await get(
        'https://api.football-data.org/v2/competitions/PL/matches',
        headers: {"X-Auth-Token": "bba664b8f36c4072b44f5c012671e2df"});*/
    Response response = await get(
        'https://elenasport-io1.p.rapidapi.com/v2/upcoming',
        headers: {"x-rapidapi-key": "c4785495fdmshece188a6182be5ap1dabf2jsn53061cf2749f"});
    Map data = jsonDecode(response.body);
    matches = data['data'];
    //lat = matches.length;
    DateTime now = new DateTime.now();
    DateTime dateToday = new DateTime(now.year, now.month, now.day);
    int i=0;
    int j=0;

    while(i<data.length) {
      try {
        while (j < matches.length) {
          homeTeam = data['data'][j]['homeName'];
          awayTeam = data['data'][j]['awayName'];
          matchStatus = data['data'][j]['status'];
          venueName = data['data'][j]['venueName'];
          leagueName = data['data'][j]['leagueName'];
          date = data['data'][j]['date'];
          matchDay = data['data'][j]['round'];
          DateTime day = DateTime.parse(date);
          home90 = data['data'][j]['team_home_90min_goals'];
          away90 = data['data'][j]['team_away_90min_goals'];
          homeET = data['data'][j]['team_home_ET_goals'];
          awayET = data['data'][j]['team_away_ET_goals'];
          homePEN = data['data'][j]['team_home_PEN_goals'];
          awayPEN = data['data'][j]['team_away_PEN_goals'];
          home1st = data['data'][j]['team_home_1stHalf_goals'];
          away1st = data['data'][j]['team_away_1stHalf_goals'];
          home2nd = data['data'][j]['team_home_2ndHalf_goals'];
          away2nd = data['data'][j]['team_away_2ndHalf_goals'];
          homeScore = homeET + homePEN + home1st + home2nd;
          awayScore = awayET + awayPEN + away1st + away2nd;
          day = new DateTime(day.year, day.month, day.day);
          setState(() {
            homeTeams.add(homeTeam);
            awayTeams.add(awayTeam);
            matchdays.add(matchDay);
            status.add(matchStatus);
            venueNames.add(venueName);
            leagueNames.add(leagueName);
            homeScores.add(homeScore.toString());
            awayScores.add(awayScore.toString());
          });
          j++;
          i++;
        }
      }
      catch(e)
    {
      print(e);
    }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
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

      body:
      SafeArea(
        child: ListView.builder(
          itemCount: homeTeams.length,
          itemBuilder: (context, index) {
           return Card(
               child: Center(
                 child: ListTile(
                   onTap: () {},
                   title: Center(
                       child:
                       showMatches ? Column(
                         children: [
                           Row(
                             children: <Widget>[
                               Text(homeTeams[index],
                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)
                               ),
                               Spacer(),
                                   status[index] == 'in progress' ?
                                   Container(
                                     color: Colors.blue[600],
                                     child: Text(homeScores[index] + '-' + awayScores[index],
                                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                                   ) :
                                   Container(
                                     color: Colors.red[600],
                                     child: Text(' VS ',
                                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)
                                     ),
                                   ),
                               Spacer(),
                               Text(awayTeams[index],
                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)
                               ),
                             ],
                           ),
                           SizedBox(height: 10.0),
                           Row(
                             children: <Widget>[
                               status[index] == 'in progress' ?
                               Text(times[index],
                                 style: TextStyle(fontSize: 10.0)) : Text(''),
                             ],
                           ),
                           Row(
                             children: <Widget>[
                               Text('Status: ' + status[index],
                               style: TextStyle(color: Colors.red),
                               ),
                             ],
                           ),
                           SizedBox(height: 10.0),
                           Row(
                             children: <Widget>[
                               Text('Venue: ' + venueNames[index],
                                 style: TextStyle(color: Colors.blue),
                               ),
                             ],
                           ),
                           Row(
                             children: <Widget>[
                               Text(leagueNames[index],
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                               ),
                             ],
                           ),
                         ],
                       )
                    : Shimmer.fromColors(
                         direction: ShimmerDirection.ltr,
                         //period: Duration(seconds: 5),

                           child: Column(
                             children: <Widget>[
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Container(
                                     height: 48.0,
                                     width: 48.0,
                                     color: Colors.white,
                                   ),
                                   Padding(
                                     padding:
                                     const EdgeInsets.symmetric(horizontal: 8.0),
                                   ),
                                   Column(
                                     children: <Widget>[
                                       Container(height: 6.0, width: 300.0, color: Colors.black),
                                       Padding(padding: EdgeInsets.all(2.0)),
                                       Container(height: 6.0, width: 300.0, color: Colors.black),
                                       Padding(padding: EdgeInsets.all(2.0)),
                                       Container(height: 6.0, width: 300.0, color: Colors.black),
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
          }
        ) 
      ),
      );
  }
}

