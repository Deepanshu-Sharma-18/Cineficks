// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Controller/genrecontroller.dart';
import 'package:moviesapi/Controller/nowplaying.dart';
import 'package:moviesapi/Controller/popularcontroller.dart';
import 'package:moviesapi/Controller/topratedcontroller.dart';
import 'package:moviesapi/Controller/upcoming.dart';
import 'package:moviesapi/Screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var genrescontrollerScreen = Get.put(GenreController());
  var topRatedScreenController = Get.put(TopRatedController());
  var popularScreenController = Get.put(PopularController());
  var upcomingScreenController = Get.put(UpcomingController());
  var nowplayingScreenController = Get.put(NowPlayingController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
