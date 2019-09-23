import 'package:http/http.dart' as http;

import 'eventsModel.dart';

class MainPageRepository {
  Future<List> getEvents(pageIndex, limit) async {
    String url =
        "https://my-json-server.typicode.com/AlexandraDamaschin/DateSliderFakeAPI/events";
    var response = await http.get(url);

    List<DateSliderItem> item = dateSliderFromJson(response.body);

    List<DateSliderItem> listOfEvents = new List<DateSliderItem>();
    return listOfEvents;
  }
}
