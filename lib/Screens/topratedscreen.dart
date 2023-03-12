// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Controller/topratedcontroller.dart';
import 'package:moviesapi/Models/Genres.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/Screens/moviedetailsscreen.dart';
import 'package:moviesapi/services/services.dart';
import 'package:moviesapi/widget/moviecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topRatedScreenController = Get.find<TopRatedController>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.black),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 35),
        body: Container(
          height: double.maxFinite,
          padding: EdgeInsets.all(0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  padding: EdgeInsets.only(top: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'TOP RATED',
                      style: GoogleFonts.dellaRespira(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(
                  (() => topRatedScreenController.isDataLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: topRatedScreenController
                              .topratedcontroller!.results!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() => Get.to(MovieDetailsScreen(
                                    id: topRatedScreenController
                                        .topratedcontroller!
                                        .results![index]
                                        .id!,
                                  ))),
                              child: MovieCard(
                                title: topRatedScreenController
                                    .topratedcontroller!.results![index].title!,
                                description: topRatedScreenController
                                    .topratedcontroller!
                                    .results![index]
                                    .overview!,
                                imagePath: topRatedScreenController
                                    .topratedcontroller!
                                    .results![index]
                                    .posterPath!,
                                rating: topRatedScreenController
                                    .topratedcontroller!
                                    .results![index]
                                    .voteAverage!,
                                rel_year: topRatedScreenController
                                    .topratedcontroller!
                                    .results![index]
                                    .releaseDate
                                    .toString(),
                                genresList: topRatedScreenController
                                    .topratedcontroller!
                                    .results![index]
                                    .genreIds!,
                              ),
                            );
                          },
                        )),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 7,
                  thickness: 7,
                  color: Colors.black,
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      (() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              topRatedScreenController.currpage > 1
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          topRatedScreenController.currpage--;
                                          topRatedScreenController
                                              .topRatedData();
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_left_outlined,
                                            size: 30,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            'Previous',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                    ),
                              SizedBox(
                                width: 80,
                              ),
                              Container(
                                height: 60,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    topRatedScreenController.currpage
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              topRatedScreenController.currpage <
                                      topRatedScreenController.totpage.value
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          topRatedScreenController.currpage++;
                                          topRatedScreenController
                                              .topRatedData();
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ' Next',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right_outlined,
                                            size: 30,
                                            color: Colors.orange,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                    ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
