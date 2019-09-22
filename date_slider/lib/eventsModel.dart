import 'dart:convert';

DateSlider dateSliderFromJson(String str) =>
    DateSlider.fromJson(json.decode(str));

String dateSliderToJson(DateSlider data) => json.encode(data.toJson());

class DateSlider {
  List<Event> events;

  DateSlider({
    this.events,
  });

  factory DateSlider.fromJson(Map<String, dynamic> json) => DateSlider(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  int id;
  DateTime date;
  String eventName;

  Event({
    this.id,
    this.date,
    this.eventName,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        eventName: json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "eventName": eventName,
      };
}
