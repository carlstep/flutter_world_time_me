import 'package:flutter/material.dart';
import 'package:flutter_world_time_me/pages/choose_location.dart';
import 'package:flutter_world_time_me/pages/home.dart';
import 'package:flutter_world_time_me/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
