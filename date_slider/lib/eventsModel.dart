import 'dart:convert';

List<DateSliderItem> dateSliderFromJson(String str) =>
    List<DateSliderItem>.from(json.decode(str).map((x) => DateSliderItem.fromJson(x)));

String dateSliderToJson(List<DateSliderItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DateSliderItem {
  int id;
  DateTime date;
  String eventName;

  DateSliderItem({
    this.id,
    this.date,
    this.eventName,
  });

  factory DateSliderItem.fromJson(Map<String, dynamic> json) => DateSliderItem(
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
