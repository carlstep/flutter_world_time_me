import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var urlWorldTime = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    var response = await http.get(urlWorldTime);
    Map data = jsonDecode(response.body);

    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    time = now.toString();
    //print(now);
  }
}
