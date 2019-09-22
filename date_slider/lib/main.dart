import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dateSlider.dart';

main() {
  runApp(MainPage());
}

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
      height: 200,
      child: Column(children: <Widget>[
        Container(child: DateSlider()),
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
