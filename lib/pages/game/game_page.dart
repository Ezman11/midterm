import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<int> listStar = [0];
  int starCount = 0;
  bool redTurn = false;
  bool showNumber = true;
  bool end = false;
  var j = 0;

  Widget _buttonNumber(String number, String coler) {
    return Expanded(
      child: ElevatedButton(
        onPressed: coler == "red" && redTurn
            ? () {
                setState(() {
                  starCount += int.parse(number);
                  redTurn = !redTurn;
                  if (starCount >= 20) end = true;
                });
              }
            : coler == "blue" && !redTurn
                ? () {
                    setState(() {
                      starCount += int.parse(number);
                      redTurn = !redTurn;
                      if (starCount >= 20) end = true;
                    });
                  }
                : coler == "red" && !redTurn
                    ? null
                    : coler == "blue" && redTurn
                        ? null
                        : end
                            ? null
                            : null,
        style: ElevatedButton.styleFrom(
            primary: coler == "red"
                ? Colors.red
                : coler == "blue"
                    ? Colors.blue
                    : null),
        child: Text(
          number,
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  Widget star() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < starCount; i++)
          Container(
            child: Icon(
              Icons.grade,
              color: Colors.purple,
            ),
          ),
        for (var i = starCount; i < 20; i++)
          Container(
            child: Icon(
              Icons.grade_outlined,
              color: Colors.purple,
            ),
          ),
      ],
    );
  }

  Widget counter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        redTurn
            ? Icon(
                Icons.keyboard_arrow_up,
                size: 60,
              )
            : Icon(
                Icons.keyboard_arrow_up,
                size: 60,
                color: Colors.black12,
              ),
        Text(
          starCount.toString(),
          style: TextStyle(fontSize: 120),
        ),
        !redTurn
            ? Icon(
                Icons.keyboard_arrow_down,
                size: 60,
              )
            : Icon(
                Icons.keyboard_arrow_down,
                size: 60,
                color: Colors.black12,
              )
      ],
    );
  }

  Widget result() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        redTurn
            ? Text('RED', style: TextStyle(fontSize: 100))
            : Text('BLUE', style: TextStyle(fontSize: 100)),
        Text('win !', style: TextStyle(fontSize: 80)),
        OutlinedButton(
          onPressed: () {
            setState(() {
              starCount = 0;
              redTurn = false;
              end = false;
            });
          },
          child: Text(
            'NEW GAME',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit
                  .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
            ),
          ),
          child: SafeArea(
            // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('3', 'red'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('2', 'red'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('1', 'red'),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        star(),
                        Expanded(
                          child: end ? result() : counter(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('1', 'blue'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('2', 'blue'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber('3', 'blue'),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ]),
            ), // Your widget tree
          )),
    );
  }
}
