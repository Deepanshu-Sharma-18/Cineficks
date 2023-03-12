import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Controller/upcoming.dart';
import 'package:moviesapi/Models/moviedetail.dart';
import 'package:moviesapi/Screens/moviedetailsscreen.dart';
import 'package:moviesapi/services/services.dart';
import 'package:moviesapi/widget/moviecard.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({super.key});

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  var upcomingScreenController = Get.find<UpcomingController>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.black),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
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
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'UPCOMING',
                      style: GoogleFonts.dellaRespira(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(
                  (() => upcomingScreenController.isDataLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: upcomingScreenController
                              .futurecontroller!.results!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() => Get.to(MovieDetailsScreen(
                                    id: upcomingScreenController
                                        .futurecontroller!.results![index].id!,
                                  ))),
                              child: MovieCard(
                                title: upcomingScreenController.futurecontroller
                                            ?.results?[index].title !=
                                        null
                                    ? upcomingScreenController.futurecontroller!
                                        .results![index].title!
                                    : "",
                                description: upcomingScreenController
                                            .futurecontroller
                                            ?.results?[index]
                                            .overview !=
                                        null
                                    ? upcomingScreenController.futurecontroller!
                                        .results![index].overview!
                                    : "",
                                imagePath: upcomingScreenController
                                            .futurecontroller
                                            ?.results?[index]
                                            .posterPath !=
                                        null
                                    ? upcomingScreenController.futurecontroller!
                                        .results![index].posterPath!
                                    : "",
                                rating: upcomingScreenController
                                            .futurecontroller!
                                            .results?[index]
                                            .voteAverage !=
                                        null
                                    ? upcomingScreenController.futurecontroller!
                                        .results![index].voteAverage!
                                    : 0.0,
                                rel_year: upcomingScreenController
                                            .futurecontroller?.dates?.maximum !=
                                        null
                                    ? upcomingScreenController
                                        .futurecontroller!.dates!.maximum
                                        .toString()
                                    : '',
                                genresList: upcomingScreenController
                                            .futurecontroller
                                            ?.results?[index]
                                            .genreIds !=
                                        null
                                    ? upcomingScreenController.futurecontroller!
                                        .results![index].genreIds!
                                    : [],
                              ),
                            );
                          },
                        )),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      (() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              upcomingScreenController.currpage > 1
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          upcomingScreenController.currpage--;
                                          upcomingScreenController
                                              .upcomingData();
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
                              Text(
                                '${upcomingScreenController.currpage}',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              upcomingScreenController.currpage <
                                      upcomingScreenController.totpage.value
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          upcomingScreenController.currpage++;
                                          upcomingScreenController
                                              .upcomingData();
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
