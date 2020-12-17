import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_app/Data/match.dart';

class FixtureDetails extends StatefulWidget {
  @override
  _FixtureDetailsState createState() => _FixtureDetailsState();
}

class _FixtureDetailsState extends State<FixtureDetails> {
  Match match = new Match();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
            'Match Details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0)
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                color: Colors.blueGrey[50],
                child: Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(12.0)),
                    Text('hometeam', style: TextStyle(fontSize: 20.0),),
                    Padding(padding: const EdgeInsets.all(18.0)),
                    Container(
                      color: Colors.indigo[900],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Score', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                        )),
                    Padding(padding: const EdgeInsets.all(18.0)),
                    Text('awayteam', style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width:430.0,
                  color:Colors.black,),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:175.0),
                    child: Text('Time'),
                  ),
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
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width:430.0,
                  color:Colors.black,),
              ),
              Row(
                children: <Widget>[
                 
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
