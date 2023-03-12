import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/services/services.dart';

class PopularController extends GetxController {
  late int currpage = 1;
  late RxInt totpage = 1.obs;

  MovieModel? popularcontroller;
  RxBool isDataLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    popualardata();
    if (kDebugMode) {
      print("<======  popular Loaded =======>");
    }
  }

  popualardata() async {
    isDataLoading.value = true;
    MovieModel data = await BaseClient(page: currpage).getPopularMovie();
    popularcontroller = data;
    totpage.value = data.totalPages!;
    isDataLoading.value = false;
  }
}
