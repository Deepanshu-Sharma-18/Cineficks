import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Controller/nowplaying.dart';
import 'package:moviesapi/Controller/popularcontroller.dart';
import 'package:moviesapi/Controller/topratedcontroller.dart';
import 'package:moviesapi/Models/nowplaying.dart';
import 'package:moviesapi/Models/upcoming.dart';
import 'package:moviesapi/Screens/moviedetailsscreen.dart';
import 'package:moviesapi/Screens/nowplayingscreen.dart';
import 'package:moviesapi/Screens/popularmovie.dart';
import 'package:moviesapi/Screens/search.dart';
import 'package:moviesapi/Screens/topratedscreen.dart';
import 'package:moviesapi/Screens/upcomingscreen.dart';
import 'package:moviesapi/services/loadimage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var popularControllerScreen = Get.find<PopularController>();
  var topratedControllerScreen = Get.find<TopRatedController>();
  var nowPlayingControllerScreen = Get.find<NowPlayingController>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.black),
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          width: 250,
          backgroundColor: Color.fromARGB(255, 23, 23, 24),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  child: Center(
                    child: Text(
                      'Cineflicks',
                      style: GoogleFonts.carme(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(PopularMovie(),
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Popular',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(UpcomingMovies(),
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Upcoming',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(HomeScreen(),
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Top Rated',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(NowPlayingMovie(),
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'On Screen',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(SearchScreen(),
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Search',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 70,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.to(SearchScreen(),
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 800));
                  },
                  icon:
                      Icon(color: Colors.white, size: 30, Icons.search_sharp)),
            )
          ],
          scrolledUnderElevation: 1,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
            child: Center(
              child: Text(
                'Cineflicks',
                style: GoogleFonts.carme(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          elevation: 20,
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      'Popular',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(PopularMovie(),
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 800));
                        },
                        child: Text(
                          'View all',
                          style: GoogleFonts.carme(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return popularControllerScreen.popularcontroller
                                ?.results?[index].posterPath !=
                            null
                        ? GestureDetector(
                            onTap: () {
                              Get.to(MovieDetailsScreen(
                                  id: popularControllerScreen
                                      .popularcontroller!.results![index].id!));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      loadImage(popularControllerScreen
                                          .popularcontroller!
                                          .results![index]
                                          .posterPath!),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          );
                  },
                  options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.7)),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      'On Screen',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(NowPlayingMovie(),
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 800));
                        },
                        child: Text(
                          'View all',
                          style: GoogleFonts.carme(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: 350,
                width: double.maxFinite,
                padding: EdgeInsets.all(15),
                child: Obx(
                  (() => nowPlayingControllerScreen.isDataLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : ListView.builder(
                          itemCount: 8,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(MovieDetailsScreen(
                                    id: nowPlayingControllerScreen
                                        .nowplayingcontroller!
                                        .results![index]
                                        .id!));
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              loadImage(
                                                  nowPlayingControllerScreen
                                                      .nowplayingcontroller!
                                                      .results![index]
                                                      .posterPath!),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rate,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            nowPlayingControllerScreen
                                                .nowplayingcontroller!
                                                .results![index]
                                                .voteAverage!
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      'TopRated',
                      style: GoogleFonts.carme(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(HomeScreen(),
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 800));
                        },
                        child: Text(
                          'View all',
                          style: GoogleFonts.carme(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: 350,
                width: double.maxFinite,
                padding: EdgeInsets.all(15),
                child: Obx(
                  (() => topratedControllerScreen.isDataLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : ListView.builder(
                          itemCount: 8,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(MovieDetailsScreen(
                                    id: topratedControllerScreen
                                        .topratedcontroller!
                                        .results![index]
                                        .id!));
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              loadImage(topratedControllerScreen
                                                  .topratedcontroller!
                                                  .results![index]
                                                  .posterPath!),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rate,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            topratedControllerScreen
                                                .topratedcontroller!
                                                .results![index]
                                                .voteAverage!
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
