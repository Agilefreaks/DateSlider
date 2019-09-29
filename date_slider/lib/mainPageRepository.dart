import 'package:http/http.dart' as http;

import 'eventsModel.dart';

class MainPageRepository {
  Future<List> getEvents(pageIndex, limit) async {
    String url =
        "https://my-json-server.typicode.com/AlexandraDamaschin/DateSliderFakeAPI/events";
    var response = await http.get(url);

    List<DateSliderItem> items = dateSliderFromJson(response.body);

    List<DateSliderItem> listOfEvents = new List<DateSliderItem>();

    for (var item in items) {
      if (listOfEvents.length < 7) {
        int i = 0;
        listOfEvents.insert(
            i,
            DateSliderItem(
                id: item.id, date: item.date, eventName: item.eventName));
        i++;
      }
    }
    return listOfEvents;
  }
}
