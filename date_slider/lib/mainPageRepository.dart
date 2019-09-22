import 'package:http/http.dart' as http;

import 'eventsModel.dart';

class MainPageRepository {
  Future getEvents() async {
    String url = "";
    var response = await http.get(url);

    DateSlider events = dateSliderFromJson(response.body);
    return events;
  }
}
