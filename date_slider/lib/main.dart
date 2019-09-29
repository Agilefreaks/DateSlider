import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dateSlider.dart';

main() async {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Date slider")), body: DateSlider());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
