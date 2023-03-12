import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/services/services.dart';

class TopRatedController extends GetxController {
  late int currpage = 1;
  late RxInt totpage = 1.obs;

  MovieModel? topratedcontroller;
  RxBool isDataLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    topRatedData();
    if (kDebugMode) {
      print("<====== top rated Loaded =======>");
    }
  }

  topRatedData() async {
    isDataLoading.value = true;
    MovieModel data = await BaseClient(page: currpage).getData();
    topratedcontroller = data;
    totpage.value = data.totalPages!;
    isDataLoading.value = false;
  }
}
