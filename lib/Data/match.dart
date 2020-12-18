import 'package:http/http.dart';
import 'dart:convert';

class Match {
  bool sameDay;
  List<dynamic> matches;
  List<dynamic> matchesl;
  String homeTeam;
  String awayTeam;
  int homeTeamID;
  int awayTeamID;
  String date;
  String matchStatus;
  String venueName;
  String leagueName;
  String starterHome;
  String starterAway;
  String stHome;
  String stAway;
  int scoreH;
  int scoreA;
  String country;
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
  int fixtureID;
  List<String> countries = new List();
  List<String> homeTeams = new List();
  List<String> awayTeams = new List();
  List<String> homeTeamIDs = new List();
  List<String> awayTeamIDs = new List();
  List<DateTime> dates;
  List<String> status = new List();
  List<String> venueNames = new List();
  List<String> leagueNames = new List();
  List<String> homeScores = new List();
  List<String> awayScores = new List();
  List<String> times = new List();
  List<String> fixtureIDs = new List();
  List<String> homeLineup = new List();
  List<String> awayLineup = new List();
  Map<dynamic, List<String>> lineHome = new Map();
  Map<dynamic, List<String>> lineAway = new Map();
  bool showMatches = false;
  bool inPlay = false;

  Future<void> getInPlay() async {
    //make the request
    Response response =
        await get('https://elenasport-io1.p.rapidapi.com/v2/inplay', headers: {
      "x-rapidapi-key": "c4785495fdmshece188a6182be5ap1dabf2jsn53061cf2749f"
    });
    Map data = jsonDecode(response.body);
    matches = data['data'];
    int i = 0;
    int j = 0;

    if (response.statusCode == 200) {
      while (i < data.length) {
        while (j < matches.length) {
          homeTeam = data['data'][j]['homeName'];
          awayTeam = data['data'][j]['awayName'];
          homeTeamID = data['data'][j]['idHome'];
          awayTeamID = data['data'][j]['idAway'];
          matchStatus = data['data'][j]['status'];
          venueName = data['data'][j]['venueName'];
          leagueName = data['data'][j]['leagueName'];
          country = data['data'][j]['countryName'];
          date = data['data'][j]['date'];
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
          fixtureID = data['data'][j]['id'];
          homeScore = homeET + home1st + home2nd;
          awayScore = awayET + away1st + away2nd;
          DateTime day = DateTime.parse(date);
          day = new DateTime(day.year, day.month, day.day);

          homeTeams.add(homeTeam);
          countries.add(country);
          awayTeams.add(awayTeam);
          status.add(matchStatus);
          venueNames.add(venueName);
          leagueNames.add(leagueName);
          homeScores.add(homeScore.toString());
          awayScores.add(awayScore.toString());
          fixtureIDs.add(fixtureID.toString());
          times.add(timeElapsed.toString());
          homeTeamIDs.add(homeTeamID.toString());
          awayTeamIDs.add(awayTeamID.toString());
          print(times);
          j++;
          i++;

          Response responsel = await get(
              'https://elenasport-io1.p.rapidapi.com/v2/fixtures/$fixtureID/lineups',
              headers: {
                "x-rapidapi-key":
                    "c4785495fdmshece188a6182be5ap1dabf2jsn53061cf2749f"
              });
          Map datal = jsonDecode(response.body);
          matchesl = datal['data'];
          int k = 0;

          if (responsel.statusCode == 200) {
            while (k < matchesl.length) {
              if (fixtureID == matchesl[k]['idFixture']) {
                if (homeTeamID == matches[k]['idTeam']) {
                  stHome = matches[k]['teamName'];
                  scoreH = homeScore;
                  homeLineup.add(matchesl[k]['playerName']);
                } else if (awayTeamID == matches[k]['idTeam']) {
                  stAway = matches[k]['teamName'];
                  scoreA = awayScore;
                  awayLineup.add(matchesl[k]['playerName']);
                }
                lineHome.putIfAbsent(fixtureID, () => homeLineup);
                lineAway.putIfAbsent(fixtureID, () => awayLineup);
              }
              k++;
            }
          } else {
            throw new Exception("Could not get lineups");
          }
        }
      }
    } else {
      throw new Exception("Could not get matches in play");
    }
  }

  Future<void> getUpcoming() async {
    //make the request
    Response response = await get(
        'https://elenasport-io1.p.rapidapi.com/v2/upcoming',
        headers: {
          "x-rapidapi-key": "c4785495fdmshece188a6182be5ap1dabf2jsn53061cf2749f"
        });
    Map data = jsonDecode(response.body);
    matches = data['data'];
    int i = 0;
    int j = 0;

    if (response.statusCode == 200) {
      while (i < data.length) {
        while (j < matches.length) {
          homeTeam = data['data'][j]['homeName'];
          awayTeam = data['data'][j]['awayName'];
          matchStatus = data['data'][j]['status'];
          venueName = data['data'][j]['venueName'];
          leagueName = data['data'][j]['leagueName'];
          country = data['data'][j]['countryName'];
          date = data['data'][j]['date'];
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
          fixtureID = data['data'][j]['id'];
          homeScore = homeET + homePEN + home1st + home2nd;
          awayScore = awayET + awayPEN + away1st + away2nd;
          day = new DateTime(day.year, day.month, day.day);

          homeTeams.add(homeTeam);
          countries.add(country);
          awayTeams.add(awayTeam);
          status.add(matchStatus);
          venueNames.add(venueName);
          leagueNames.add(leagueName);
          homeScores.add(homeScore.toString());
          awayScores.add(awayScore.toString());
          fixtureIDs.add(fixtureID.toString());
          print(venueNames);
          j++;
          i++;
        }
      }
    } else {
      throw new Exception("Could not get today's matches");
    }
  }

  Future<void> getLineUps() async {}
}
