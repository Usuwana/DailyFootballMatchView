
import 'package:http/http.dart';
import 'dart:convert';


class Match {

  int matchDay;
  bool sameDay;
  List<dynamic> matches;
  //Map homeTeam;
  String homeTeam;
  //Map awayTeam;
  String awayTeam;
  String date;


  Future<void> getData() async {
    //make the request
    Response response = await get(
        'https://api.football-data.org/v2/competitions/PL/matches',
        headers: {"X-Auth-Token": "bba664b8f36c4072b44f5c012671e2df"});
    Map data = jsonDecode(response.body);
    matches = data['matches'];
    DateTime now = new DateTime.now();
    DateTime dateToday = new DateTime(now.year, now.month, now.day);
    int i=0;
    int j=0;

    while(i<data.length)
    {
      while(j<matches.length)
      {
        homeTeam = data['matches'][j]['homeTeam']['name'];
        awayTeam = data['matches'][j]['awayTeam']['name'];
        date = data['matches'][j]['utcDate'];
        matchDay = data['matches'][j]['matchday'];
        DateTime day = DateTime.parse(date);
        day = new DateTime(day.year, day.month, day.day);
        if(day.year == dateToday.year)
        {
          if(day.month == dateToday.month)
          {
            if(day.day == dateToday.day)
            {
              //setState(() {
                //homeTeams.add(homeTeam);
                //awayTeams.add(awayTeam);
                //matchdays.add(matchDay);
                //print(date);
             // });
            }
          }
        }
        j++;
        i++;
      }
    }
    //print(matches.length);
  }

}
