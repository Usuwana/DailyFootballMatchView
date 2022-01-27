import 'package:football_app/main/utils/imports.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void setupFixtures() {
    Navigator.pushNamed(context, '/current');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Center(
            child: Text(
              'Football Application',
              style: TextStyle(color: Colors.white),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 250.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListTile(
                    tileColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, '/upcoming');
                    },
                    title: Center(
                      child: Text(
                        'Scheduled fixtures',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /*Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListTile(
                    tileColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, '/live');
                    },
                    title: Center(
                      child: Text('Live Fixtures',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
