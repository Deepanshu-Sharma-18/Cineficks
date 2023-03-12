import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/Models/upcoming.dart';
import 'package:moviesapi/Screens/upcomingscreen.dart';
import 'package:moviesapi/services/services.dart';

class UpcomingController extends GetxController {
  late int currpage = 1;
  late RxInt totpage = 1.obs;

  FutureMovie? futurecontroller;
  RxBool isDataLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    upcomingData();
    if (kDebugMode) {
      print("<====== Upcoming Loaded =======>");
    }
  }

  upcomingData() async {
    isDataLoading.value = true;
    FutureMovie data = await BaseClient(page: currpage).getUpcoming();
    futurecontroller = data;
    totpage.value = data.totalPages!;
    isDataLoading.value = false;
  }
}
