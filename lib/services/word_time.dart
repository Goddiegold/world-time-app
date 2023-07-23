// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var response =
          await http.get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);

      var datetime = data["datetime"];
      String offset = data["utc_offset"];

      // print(datetime);
      // print(offset);
      // print(offset.substring(1, 3));

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "Couldn't find time G";
    }
  }
}
