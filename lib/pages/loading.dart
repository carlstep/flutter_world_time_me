import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // var response = await http.get(url);
    // Map data = jsonDecode(response.body);

    // print(data);
    // print(data['title']);
    // print(data['completed']);

    var url = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);

    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(datetime);
    //print(offset);

    //create DateTime obect
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
