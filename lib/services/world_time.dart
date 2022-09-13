import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // is true = daytime, is false = nighttime

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var urlWorldTime = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(urlWorldTime);
      Map data = jsonDecode(response.body);

      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      // DateFormat.jm().format(now) >> enabled with package: 'intl'
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      //print(now);

    } catch (e) {
      print('caught error -- $e');
      time = 'could not get time data';
    }
  }
}
