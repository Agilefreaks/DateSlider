import 'package:date_slider/mainPageBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:intl/intl.dart';

import 'dateItem.dart';
import 'eventsModel.dart';

class DateSlider extends StatefulWidget {
  DateSlider({Key key}) : super(key: key);

  @override
  _DateSliderState createState() => _DateSliderState();
}

String formatDateTime(DateTime dateTime, String format) {
  final DateFormat formatter = new DateFormat(format);

  return formatter.format(dateTime);
}

class _DateSliderState extends State<DateSlider> {
  DateTime selectedDay =
      DateTime.parse(formatDateTime(DateTime.now(), "yyyy-MM-dd"));

  final MainPageBloc _mainPageBloc = MainPageBloc();

  //dates
  DateTime startDayInterval = DateTime.now().subtract(Duration(days: 3)); //24
  DateTime endDayInterval = DateTime.now().add(Duration(days: 3));

  static const DEFAULT_PAGE_SIZE = 7;
  static const DEFAULT_ITEM_SIZE = 50.0;

  int pageSize = 7;

  DateSliderItem currentDateSliderItem;

  @override
  void initState() {
    currentDateSliderItem = new DateSliderItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(height: 100, child: _buildDateSlider()),
        ],
      ),
    );
  }

  Widget _buildDateSlider() {
    Size screenSize = MediaQuery.of(context).size;
    //the slider items will cover 90% of the page
    //the rest will be allocated as padding
    var sliderTotalWidth = screenSize.width;
    var pageSize =
        ((sliderTotalWidth / DEFAULT_ITEM_SIZE) / DEFAULT_PAGE_SIZE).floor() *
            DEFAULT_PAGE_SIZE;

    double emptySpace = screenSize.width - (DEFAULT_ITEM_SIZE * pageSize);
    return new PagewiseListView(
      //this makes scrolling "pageSize" items at once
      physics: PageScrollPhysics(),
      pageSize: pageSize,
      scrollDirection: Axis.horizontal,
      reverse: true,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (BuildContext context, entry, index) {
        return GestureDetector(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: emptySpace / (pageSize * 2)),
                child: buildDateSliderItem(entry)),
            onTap: () {
              selectedDay = entry.date;
              currentDateSliderItem = entry;
              setState(() {});
            });
      },
      pageFuture: (pageIndex) => _mainPageBloc.loadEvents(pageIndex, pageSize),
    );
  }

  Widget buildDateSliderItem(DateSliderItem event) {
    String entryDateAsDate = DateFormat.yMd().format(event.date);
    String selectedDateAsDate = DateFormat.yMd().format(selectedDay);
    if (entryDateAsDate == selectedDateAsDate)
      return ActiveItem(item: event);
    else
      return InactiveItem(item: event);
  }
}
