import 'package:flutter/cupertino.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

class DateSlider extends StatefulWidget {
  DateSlider({Key key}) : super(key: key);

  @override
  _DateSliderState createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {
  DateTime selectedDay = DateTime.parse("yyyy-MM-dd");

  //dates
  DateTime startDayInterval = DateTime.now().subtract(Duration(days: 3)); //24
  DateTime endDayInterval = DateTime.now().add(Duration(days: 3));

  static const DEFAULT_PAGE_SIZE = 7;
  static const DEFAULT_ITEM_SIZE = 50.0;

  int pageSize = 7;

  @override
  Widget build(BuildContext context) {
    return _buildDateSlider();
  }

  Widget _buildDateSlider() {
    //the slider items will cover 90% of the page
    //the rest will be allocated as padding
    var sliderTotalWidth = 400;
    var pageSize =
        ((sliderTotalWidth / DEFAULT_ITEM_SIZE) / DEFAULT_PAGE_SIZE).floor() *
            DEFAULT_PAGE_SIZE;

    double emptySpace = 400 - (DEFAULT_ITEM_SIZE * pageSize);
    return new PagewiseListView(
      //this makes scrolling "pageSize" items at once
      physics: PageScrollPhysics(),
      pageSize: pageSize,
      scrollDirection: Axis.horizontal,
      reverse: true,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, entry, index) {
        return GestureDetector(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: emptySpace / (pageSize * 2)),
                child: buildDateSliderItem(entry)),
            onTap: () {
              selectedDay = entry.date;
              setState(() {});
            });
      },
      pageFuture: (pageIndex) =>
          widget._workspaceBloc.loadDailyTotals(pageIndex, pageSize),
    );
  }

  Widget buildDateSliderItem(DailyTotal dailyTotal) {
    String entryDateAsDate = DateFormat.yMd().format(dailyTotal.date);
    String selectedDateAsDate = DateFormat.yMd().format(selectedDay);
    String currentdDateAsDate = DateFormat.yMd().format(DateTime.now());
    if (entryDateAsDate == selectedDateAsDate)
      return ActiveDateSliderItem(item: dailyTotal);
    else if (entryDateAsDate == currentdDateAsDate)
      return CurrentDateSliderItem(item: dailyTotal);
    else
      return InactiveDateSliderItem(item: dailyTotal);
  }
}
