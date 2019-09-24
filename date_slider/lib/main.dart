import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dateSlider.dart';

main() async {
  runApp(MaterialApp(home: MainPage()));
  // runApp(new MediaQuery(
  //     data: new MediaQueryData.fromWindow(ui.window),
  //     child: new Directionality(
  //         textDirection: TextDirection.rtl, child: new MainPage())));
  // runApp(MainPage());
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
      height:  MediaQuery.of(context).size.height,
      child: Column(children: <Widget>[
        // Text("Hello"),
        // Text("Say hello")
        Container(child: DateSlider()),
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
