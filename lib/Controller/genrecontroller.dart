import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Models/Genres.dart';
import 'package:moviesapi/services/services.dart';

class GenreController extends GetxController {
  Genres? genrecontroller;

  @override
  void onInit() {
    super.onInit();
    _GenreData();
    if (kDebugMode) {
      print("<====== Data Loaded =======>");
    }
  }

  _GenreData() async {
    Genres data = await BaseClient(page: 1).getGenres();
    genrecontroller = data;
  }
}
