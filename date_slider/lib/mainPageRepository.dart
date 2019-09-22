import 'package:http/http.dart' as http;

import 'eventsModel.dart';

class MainPageRepository {
  Future<List> getEvents(pageIndex, limit) async {
    String url =
        "https://my-json-server.typicode.com/AlexandraDamaschin/DateSliderFakeAPI/events";
    var response = await http.get(url);

    DateSlider events = dateSliderFromJson(response.body);

    List<Event> listOfEvents = new List<Event>();
    return listOfEvents;
  }
}
