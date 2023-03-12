import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/Models/nowplaying.dart';
import 'package:moviesapi/services/services.dart';

class NowPlayingController extends GetxController {
  late int currpage = 1;
  late RxInt totpage = 1.obs;

  NowPlaying? nowplayingcontroller;
  RxBool isDataLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    nowPlayingData();
    if (kDebugMode) {
      print("<====== Now Playing Loaded =======>");
    }
  }

  nowPlayingData() async {
    isDataLoading.value = true;
    NowPlaying data = await BaseClient(page: currpage).getNowPlaying();
    nowplayingcontroller = data;
    totpage.value = data.totalPages!;
    isDataLoading.value = false;
  }
}
