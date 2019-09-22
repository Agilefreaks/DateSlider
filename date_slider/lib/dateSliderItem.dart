import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'eventsModel.dart';

class ActiveItem extends StatelessWidget {
  final Event item;
  ActiveItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      children: <Widget>[
        Text(
          item.date.toIso8601String(),
          style: TextStyle(color: Colors.blue),
        ),
        CircularProfileAvatar(
          '',
          elevation: 4,
          backgroundColor: Colors.blue,
          radius: 25,
          initialsText: Text(
            item.date.month.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class InactiveItem extends StatelessWidget {
  final Event item;
  InactiveItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(item.date.toIso8601String()),
      CircularProfileAvatar(
        '',
        elevation: 4,
        radius: 25,
        borderColor: Colors.grey,
        initialsText: Text(
          item.date.month.toString(),
          style: TextStyle(fontSize: 18),
        ),
      )
    ]);
  }
}
