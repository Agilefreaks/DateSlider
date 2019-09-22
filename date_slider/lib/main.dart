import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 500,
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.23),
                    offset: Offset(0.0, 6.0),
                    blurRadius: 3.0),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0.0, 6.0),
                  blurRadius: 3.0,
                )
              ],
            ),
            height: 95,
            width: 400,
            alignment: Alignment.center,
            child: DateSlider()),
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
