import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  var round = 0;


  Widget _personRed() {
    return Column(children: [
      Row(children: [
        Icon(Icons.person, // รูปไอคอน
            size: 75.0, // ขนาดไอคอน
            color: Color(0xFFA00000) // สีไอคอน
            ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/flag_ireland.png'),
                  height: 25,
                ),
                SizedBox(width: 5),
                Text(
                  'IRELAND',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'HARRINGTON kellie Anne',
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ])
    ]);
  }

  Widget _personBlue() {
    return Column(children: [
      Row(children: [
        Icon(Icons.person, // รูปไอคอน
            size: 75.0, // ขนาดไอคอน
            color: Color(0xFF0000A0) // สีไอคอน
            ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/flag_thailand.png'),
                  height: 25,
                ),
                SizedBox(width: 5),
                Text(
                  'THAILAND',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'SEESONDEE Sudaporn',
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ])
    ]);
  }

  Widget _addScore(int red, int blue, var round) {
    return Column(children: [
      SizedBox(height: 15),
      Text(
        'ROUND ' + round.toString(),
        style: TextStyle(fontSize: 20),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          red.toString(),
          style: TextStyle(fontSize: 40),
        ),
        Text(
          blue.toString(),
          style: TextStyle(fontSize: 40),
        ),
      ]),
      SizedBox(height: 15),
      Divider(
        height: 8,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OLYMPIC BOXING SCORING'),
          backgroundColor: Color(0xff7d1d2b),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(children: [
            SizedBox(height: 15),
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 15),
            Container(
              height: 30,
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                'Women\'s Light (57-60kg) Semi-final',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            _personRed(),
            _personBlue(),
            Container(
              height: 8,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFA00000),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Color(0xFF0000A0),
                    ),
                  ),
                ],
              ),
            ),
            _addScore(1, 1, 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _addScore(10, 9, round);
                    });
                  },
                  child: Icon(
                    Icons.person, // รูปไอคอน
                    size: 30.0, // ขนาดไอคอน
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA00000),
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width /5   ,vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child: Icon(
                    Icons.person, // รูปไอคอน
                    size: 30.0, // ขนาดไอคอน
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0000A0),
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5  ,vertical: 10),
                  ),
                )
              ],
            )]),
        ));
  }
}

class Palette {
  static const MaterialColor myColor = const MaterialColor(
    0xff8b2030,
    const <int, Color>{
      50: const Color(0xff7d1d2b), //10%
      100: const Color(0xff6f1a26), //20%
      200: const Color(0xff611622), //30%
      300: const Color(0xff53131d), //40%
      400: const Color(0xff461018), //50%
      500: const Color(0xff380d13), //60%
      600: const Color(0xff2a0a0e), //70%
      700: const Color(0xff1c060a), //80%
      800: const Color(0xff0e0305), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
